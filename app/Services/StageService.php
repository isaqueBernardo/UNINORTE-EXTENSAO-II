<?php
namespace App\Services;

use App\Models\Certificate;
use App\Models\Enrollment;
use App\Models\PathStage;
use App\Models\StageProgress;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;

class StageService
{
    public function complete(User $user, Enrollment $enrollment, PathStage $stage, string $answer): array
    {
        return DB::transaction(function () use ($user, $enrollment, $stage, $answer): array {
            $enrollment = Enrollment::whereKey($enrollment->id)->lockForUpdate()->firstOrFail();
            abort_unless($enrollment->user_id === $user->id && $stage->learning_path_id === $enrollment->learning_path_id, 403);
            $stages = $enrollment->path->stages()->get();
            $completed = StageProgress::where('enrollment_id', $enrollment->id)->whereNotNull('completed_at')->pluck('path_stage_id')->all();
            $next = $stages->first(fn ($item) => !in_array($item->id, $completed, true));
            if (!$next) return ['ok' => true, 'message' => 'Trilha concluida.', 'completed' => true];
            if ($next->id !== $stage->id) throw ValidationException::withMessages(['answer' => 'Primeiro conclua as fases anteriores.']);
            $progress = StageProgress::firstOrCreate(['enrollment_id' => $enrollment->id, 'path_stage_id' => $stage->id]);
            $progress->increment('attempts');
            $progress->answer = $answer;
            $progress->save();
            if ($stage->mission_type === 'choice') {
                if (!ctype_digit($answer) || (int) $answer !== (int) $stage->correct_option) {
                    throw ValidationException::withMessages(['answer' => 'Ainda nao! Revise a aula e tente novamente.']);
                }
            } elseif (mb_strlen(trim($answer)) < 25) {
                throw ValidationException::withMessages(['answer' => 'Descreva sua ideia em pelo menos 25 caracteres.']);
            }
            $progress->completed_at = now();
            $progress->save();
            $user->increment('xp', $stage->xp_reward);
            $finished = count($completed) + 1 === $stages->count();
            if ($finished) {
                $enrollment->completed_at = now();
                $enrollment->save();
                Certificate::firstOrCreate(['enrollment_id' => $enrollment->id], [
                    'user_id' => $user->id,
                    'verification_code' => 'RT-'.strtoupper(Str::random(12)),
                    'issued_at' => now(),
                ]);
            }
            return ['ok' => true, 'completed' => $finished, 'earned_xp' => $stage->xp_reward];
        });
    }
}
