<?php
namespace App\Http\Controllers;

use App\Models\Enrollment;
use App\Models\Feedback;
use App\Models\LearningPath;
use App\Models\PathStage;
use App\Services\StageService;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

class PathController extends Controller
{
    private function accessible(LearningPath $path, Request $request): void
    {
        abort_unless($path->published && ($path->school_id === null || $path->school_id === $request->user()->school_id), 404);
    }
    public function show(LearningPath $path, Request $request)
    {
        $this->accessible($path, $request);
        $path->load(['career', 'stages']);
        $enrollment = Enrollment::where('user_id', $request->user()->id)->where('learning_path_id', $path->id)->with(['progress', 'certificate'])->first();
        $completedStageIds = $enrollment ? $enrollment->progress->whereNotNull('completed_at')->pluck('path_stage_id')->all() : [];
        return view('paths.show', compact('path', 'enrollment', 'completedStageIds'));
    }
    public function enroll(LearningPath $path, Request $request)
    {
        $this->accessible($path, $request);
        abort_if($path->stages()->count() === 0, 422, 'Trilha sem fases disponiveis.');
        Enrollment::firstOrCreate(['user_id' => $request->user()->id, 'learning_path_id' => $path->id]);
        return redirect()->route('paths.show', $path)->with('success', 'Trilha desbloqueada! Vamos para a primeira fase.');
    }
    public function stage(LearningPath $path, PathStage $stage, Request $request)
    {
        $this->accessible($path, $request);
        abort_unless($stage->learning_path_id === $path->id, 404);
        $enrollment = Enrollment::where('user_id', $request->user()->id)->where('learning_path_id', $path->id)->with('progress')->firstOrFail();
        $done = $enrollment->progress->whereNotNull('completed_at')->pluck('path_stage_id')->all();
        $next = $path->stages()->whereNotIn('id', $done)->orderBy('position')->first();
        abort_unless(in_array($stage->id, $done, true) || $next?->id === $stage->id, 403, 'Conclua as fases anteriores.');
        $alreadyDone = in_array($stage->id, $done, true);
        return view('paths.stage', compact('path', 'stage', 'enrollment', 'alreadyDone'));
    }
    public function complete(LearningPath $path, PathStage $stage, Request $request, StageService $service)
    {
        $this->accessible($path, $request);
        abort_unless($stage->learning_path_id === $path->id, 404);
        $data = $request->validate(['answer' => ['required', 'string', 'max:4000']]);
        $enrollment = Enrollment::where('user_id', $request->user()->id)->where('learning_path_id', $path->id)->firstOrFail();
        $result = $service->complete($request->user(), $enrollment, $stage, $data['answer']);
        return redirect()->route('paths.show', $path)->with('success', $result['completed'] ? 'Trilha zerada! Seu certificado foi emitido.' : 'Missao concluida! +'.$result['earned_xp'].' XP');
    }
    public function feedback(LearningPath $path, Request $request)
    {
        $this->accessible($path, $request);
        $data = $request->validate(['rating' => ['required', 'integer', 'between:1,5'], 'comment' => ['nullable', 'string', 'max:400']]);
        abort_unless(Enrollment::where('user_id', $request->user()->id)->where('learning_path_id', $path->id)->whereNotNull('completed_at')->exists(), 403);
        Feedback::updateOrCreate(['user_id' => $request->user()->id, 'learning_path_id' => $path->id], $data);
        return back()->with('success', 'Sua opiniao ajudara a melhorar as trilhas!');
    }
}
