<?php
namespace App\Http\Controllers;

use App\Models\CareerAnswer;
use App\Models\CareerProfile;
use App\Models\CareerQuestion;
use App\Models\Classroom;
use App\Models\LearningPath;
use App\Models\PathStage;
use App\Models\School;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;

/** CRUD do painel escolar. Professores nunca editam outra escola nem acessos administrativos. */
class ManagementController extends Controller
{
    public function index(Request $request)
    {
        $teacher = $request->user()->role === 'teacher';
        abort_if($teacher && !$request->user()->school_id, 403, 'Professor sem escola vinculada.');
        $schoolId = $request->user()->school_id;
        $careers = CareerProfile::orderBy('name')->get();
        $questions = CareerQuestion::with('answers')->orderBy('position')->get();
        $paths = LearningPath::with(['career', 'stages'])->when($teacher, fn ($q) => $q->where('school_id', $schoolId))->latest()->get();
        $schools = $teacher ? School::whereKey($schoolId)->get() : School::orderBy('name')->get();
        $classes = Classroom::when($teacher, fn ($q) => $q->where('school_id', $schoolId))->with('school')->orderBy('name')->get();
        $users = $teacher ? collect() : User::with('school')->latest()->limit(80)->get();
        return view('admin.manage', compact('teacher', 'careers', 'questions', 'paths', 'schools', 'classes', 'users'));
    }

    public function school(Request $request, ?School $school = null)
    {
        $this->admin($request);
        $data = $request->validate([
            'name' => 'required|string|max:160', 'code' => ['required', 'alpha_dash:ascii', 'max:20', Rule::unique('schools', 'code')->ignore($school?->id)],
            'city' => 'nullable|string|max:100', 'state' => 'nullable|size:2', 'active' => 'nullable|boolean',
        ]);
        $data['code'] = strtoupper($data['code']); $data['active'] = $request->boolean('active');
        $school ? $school->update($data) : School::create($data);
        return back()->with('success', 'Escola salva. Compartilhe o codigo apenas com sua comunidade escolar.');
    }

    public function classroom(Request $request, ?Classroom $classroom = null)
    {
        $data = $request->validate(['school_id' => 'required|exists:schools,id', 'name' => 'required|string|max:80', 'school_year' => 'required|string|max:9']);
        $this->ensureSchool($request, (int) $data['school_id']);
        if ($classroom) $this->ensureSchool($request, $classroom->school_id);
        $classroom ? $classroom->update($data) : Classroom::create($data);
        return back()->with('success', 'Turma salva.');
    }

    public function user(Request $request, ?User $user = null)
    {
        $this->admin($request);
        $data = $request->validate([
            'name' => 'required|string|max:120', 'email' => ['required', 'email', 'max:190', Rule::unique('users', 'email')->ignore($user?->id)],
            'school_id' => 'nullable|exists:schools,id', 'classroom_id' => 'nullable|exists:classrooms,id',
            'role' => 'required|in:student,teacher,admin', 'password' => [$user ? 'nullable' : 'required', 'string', 'min:10'],
        ]);
        if (!empty($data['classroom_id'])) {
            $belongs = Classroom::whereKey($data['classroom_id'])->where('school_id', $data['school_id'])->exists();
            if (!$belongs) throw ValidationException::withMessages(['classroom_id' => 'A turma nao pertence a esta escola.']);
        }
        if ($data['role'] !== 'admin' && !$data['school_id']) {
            throw ValidationException::withMessages(['school_id' => 'Professor e estudante precisam de uma escola.']);
        }
        if (empty($data['password'])) unset($data['password']);
        if ($user && $user->id === $request->user()->id && $data['role'] !== 'admin') abort(422, 'Nao remova seu proprio perfil de administrador.');
        $user ? $user->update($data) : User::create($data);
        return back()->with('success', 'Usuario salvo.');
    }

    public function career(Request $request, ?CareerProfile $career = null)
    {
        $this->admin($request);
        $data = $request->validate([
            'name' => 'required|string|max:120', 'slug' => ['required', 'alpha_dash', 'max:100', Rule::unique('career_profiles', 'slug')->ignore($career?->id)],
            'description' => 'required|string|max:2000', 'icon' => 'required|string|max:40', 'accent' => ['required', 'regex:/^#[0-9a-fA-F]{6}$/'],
            'skills_text' => 'nullable|string|max:2000', 'projects_text' => 'nullable|string|max:2000',
        ]);
        $data['skills'] = $this->lines($data['skills_text'] ?? '');
        $data['starter_projects'] = $this->lines($data['projects_text'] ?? '');
        unset($data['skills_text'], $data['projects_text']);
        $data['active'] = $request->boolean('active');
        $career ? $career->update($data) : CareerProfile::create($data);
        return back()->with('success', 'Carreira salva com sucesso.');
    }

    public function question(Request $request, ?CareerQuestion $question = null)
    {
        $this->admin($request);
        $data = $request->validate([
            'title' => 'required|string|max:180', 'scenario' => 'required|string|max:1500', 'category' => 'required|string|max:80',
            'position' => ['required', 'integer', 'min:1', 'max:999', Rule::unique('career_questions', 'position')->ignore($question?->id)],
            'answers_json' => 'required|json',
        ]);
        $answers = json_decode($data['answers_json'], true);
        if (!is_array($answers) || !array_is_list($answers) || count($answers) < 2 || count($answers) > 6) {
            throw ValidationException::withMessages(['answers_json' => 'Informe de 2 a 6 respostas em uma lista JSON.']);
        }
        $slugs = CareerProfile::pluck('slug')->all();
        foreach ($answers as $a) {
            if (!is_array($a) || !is_string($a['label'] ?? null) || mb_strlen($a['label']) > 240 || !is_array($a['scores'] ?? null)) {
                throw ValidationException::withMessages(['answers_json' => 'Cada resposta precisa de label e scores.']);
            }
            foreach ($a['scores'] as $slug => $score) {
                if (!in_array($slug, $slugs, true) || !is_int($score) || $score < 0 || $score > 5) {
                    throw ValidationException::withMessages(['answers_json' => 'Pontuacao invalida: use slug cadastrado e nota inteira de 0 a 5.']);
                }
            }
        }
        DB::transaction(function () use ($question, $data, $request, $answers): void {
            $values = collect($data)->except('answers_json')->all();
            $values['active'] = $request->boolean('active');
            $model = $question ?: new CareerQuestion();
            $model->fill($values)->save();
            // Atualize IDs estaveis para preservar respostas historicas nas partidas.
            $existing = $model->answers()->orderBy('position')->get();
            if ($existing->count() > count($answers)) {
                throw ValidationException::withMessages(['answers_json' => 'Para preservar o historico, nao reduza o numero de opcoes. Desative a pergunta e crie outra.']);
            }
            foreach ($answers as $i => $answer) {
                $values = ['label' => trim($answer['label']), 'scores' => $answer['scores'], 'feedback' => mb_substr($answer['feedback'] ?? '', 0, 240), 'position' => $i + 1];
                if ($existing->has($i)) $existing[$i]->update($values);
                else $model->answers()->create($values);
            }
        });
        return back()->with('success', 'Desafio salvo. A proxima partida utilizara o novo conteudo.');
    }

    public function path(Request $request, ?LearningPath $path = null)
    {
        $data = $request->validate([
            'career_profile_id' => 'required|exists:career_profiles,id', 'title' => 'required|string|max:160',
            'description' => 'required|string|max:2000', 'estimated_minutes' => 'required|integer|between:10,10000',
            'school_id' => 'nullable|exists:schools,id',
        ]);
        if ($path) $this->canEditPath($request, $path);
        if ($request->user()->role === 'teacher') $data['school_id'] = $request->user()->school_id;
        else $data['school_id'] = $data['school_id'] ?? null;
        if (!$path) {
            $data['slug'] = Str::slug($data['title']).'-'.strtolower(Str::random(5));
        }
        $data['published'] = $request->boolean('published');
        $path ? $path->update($data) : LearningPath::create($data);
        return back()->with('success', 'Trilha salva. Adicione as fases abaixo.');
    }

    public function stage(Request $request, LearningPath $path, ?PathStage $stage = null)
    {
        $this->canEditPath($request, $path);
        abort_if($stage && $stage->learning_path_id !== $path->id, 404);
        $data = $request->validate([
            'position' => ['required', 'integer', 'between:1,999', Rule::unique('path_stages', 'position')->where('learning_path_id', $path->id)->ignore($stage?->id)],
            'title' => 'required|string|max:150', 'description' => 'required|string|max:800', 'lesson' => 'required|string|max:12000',
            'mission_type' => 'required|in:choice,reflection', 'mission_prompt' => 'required|string|max:1200',
            'options_text' => 'nullable|string|max:3000', 'correct_option' => 'nullable|integer|between:0,9',
            'xp_reward' => 'required|integer|between:1,500', 'estimated_minutes' => 'required|integer|between:1,600',
        ]);
        if ($data['mission_type'] === 'choice') {
            $options = $this->lines($data['options_text'] ?? '');
            if (count($options) < 2 || count($options) > 6 || !isset($options[$data['correct_option'] ?? -1])) {
                throw ValidationException::withMessages(['options_text' => 'Adicione 2 a 6 opcoes e indique o indice correto (a primeira e 0).']);
            }
            $data['options'] = $options;
        } else { $data['options'] = null; $data['correct_option'] = null; }
        unset($data['options_text']);
        $stage ? $stage->update($data) : $path->stages()->create($data);
        return back()->with('success', 'Fase salva com sucesso.');
    }

    public function removeStage(Request $request, LearningPath $path, PathStage $stage)
    {
        $this->canEditPath($request, $path);
        abort_unless($stage->learning_path_id === $path->id, 404);
        abort_if($path->enrollments()->exists(), 422, 'Nao remova uma fase com alunos matriculados. Despublique a trilha e crie outra versao.');
        $stage->delete();
        return back()->with('success', 'Fase excluida.');
    }

    private function canEditPath(Request $request, LearningPath $path): void
    {
        if ($request->user()->role === 'admin') return;
        abort_unless($path->school_id !== null && $path->school_id === $request->user()->school_id, 403);
    }
    private function ensureSchool(Request $request, int $schoolId): void
    {
        abort_unless($request->user()->role === 'admin' || $request->user()->school_id === $schoolId, 403);
    }
    private function admin(Request $request): void { abort_unless($request->user()->role === 'admin', 403); }
    private function lines(string $text): array { return array_values(array_filter(array_map('trim', preg_split('/\R/', $text)), fn ($s) => $s !== '')); }
}
