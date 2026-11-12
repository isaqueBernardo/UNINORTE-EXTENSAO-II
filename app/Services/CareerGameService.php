<?php
namespace App\Services;

use App\Models\CareerAttempt;
use App\Models\CareerProfile;
use App\Models\CareerQuestion;
use App\Models\CareerResponse;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;

/** A pontuacao vocacional ocorre apenas no servidor; o cliente nao determina o resultado. */
class CareerGameService
{
    public function getOrStart(User $user): CareerAttempt
    {
        $attempt = $user->attempts()->where('status', 'in_progress')->latest('id')->first();
        if ($attempt) {
            // Uma tentativa pode ter sido criada antes de executar o seeder.
            // Recuperar somente partidas ainda sem respostas para nao mudar uma jornada em andamento.
            if (empty($attempt->question_ids) && ! $attempt->responses()->exists()) {
                $ids = CareerQuestion::where('active', true)
                    ->whereHas('answers')
                    ->orderBy('position')
                    ->pluck('id')
                    ->all();
                if ($ids !== []) {
                    $attempt->question_ids = $ids;
                    $attempt->save();
                }
            }
            return $attempt;
        }
        return $user->attempts()->create([
            'status' => 'in_progress', 'scores' => [],
            'question_ids' => CareerQuestion::where('active', true)->whereHas('answers')->orderBy('position')->pluck('id')->all(),
        ]);
    }

    public function state(CareerAttempt $attempt): array
    {
        $ids = $attempt->question_ids ?? [];
        $questions = CareerQuestion::whereIn('id', $ids)->get()->sortBy(fn ($q) => array_search($q->id, $ids, true))->values();
        $responseCount = $attempt->responses()->count();
        $question = $questions->get($responseCount);
        return [
            'attempt_id' => $attempt->id,
            'finished' => $attempt->status === 'completed',
            'total' => $questions->count(),
            'answered' => $responseCount,
            'question' => $attempt->status === 'completed' || !$question ? null : [
                'id' => $question->id,
                'title' => $question->title,
                'scenario' => $question->scenario,
                'category' => $question->category,
                'options' => $question->answers()->get(['id', 'label'])->toArray(),
            ],
            'result_url' => $attempt->status === 'completed' ? route('game.result', $attempt) : null,
        ];
    }

    public function answer(User $user, CareerAttempt $attempt, int $questionId, int $answerId): array
    {
        return DB::transaction(function () use ($user, $attempt, $questionId, $answerId): array {
            $attempt = CareerAttempt::whereKey($attempt->id)->lockForUpdate()->firstOrFail();
            abort_unless($attempt->user_id === $user->id, 403);
            if ($attempt->status !== 'in_progress') {
                throw ValidationException::withMessages(['answer' => 'Essa partida ja foi concluida.']);
            }
            $ids = $attempt->question_ids ?? [];
            $questions = CareerQuestion::whereIn('id', $ids)->get()->sortBy(fn ($q) => array_search($q->id, $ids, true))->values();
            $index = $attempt->responses()->count();
            $current = $questions->get($index);
            if (!$current || $current->id !== $questionId) {
                throw ValidationException::withMessages(['answer' => 'Responda a missao atual antes de avancar.']);
            }
            $answer = $current->answers()->whereKey($answerId)->first();
            if (!$answer) throw ValidationException::withMessages(['answer' => 'Opcao invalida para esta missao.']);
            CareerResponse::create(['career_attempt_id' => $attempt->id, 'career_question_id' => $current->id, 'career_answer_id' => $answer->id]);
            $scores = $attempt->scores ?: [];
            foreach (($answer->scores ?: []) as $slug => $points) {
                if (!is_numeric($points)) continue;
                $scores[$slug] = ($scores[$slug] ?? 0) + max(0, min(5, (int) $points));
            }
            $attempt->scores = $scores;
            if ($index + 1 === $questions->count()) {
                $careers = CareerProfile::where('active', true)->orderBy('id')->get();
                $winner = $careers->sortByDesc(fn ($career) => (int) ($scores[$career->slug] ?? 0))->first();
                if (!$winner) throw ValidationException::withMessages(['answer' => 'Nao ha carreiras ativas cadastradas.']);
                $firstCompletion = ! CareerAttempt::where('user_id', $user->id)->where('status', 'completed')->exists();
                $attempt->status = 'completed';
                $attempt->result_career_id = $winner->id;
                $attempt->completed_at = now();
                if ($firstCompletion) $user->increment('xp', 120);
            }
            $attempt->save();
            return array_merge($this->state($attempt), ['feedback' => $answer->feedback, 'earned_xp' => ($firstCompletion ?? false) ? 120 : 0]);
        });
    }
}
