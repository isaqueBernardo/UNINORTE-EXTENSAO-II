<?php
namespace App\Http\Controllers;

use App\Models\CareerAttempt;
use App\Models\CareerProfile;
use App\Models\LearningPath;
use App\Services\CareerGameService;
use Illuminate\Http\Request;

class GameController extends Controller
{
    public function index(CareerGameService $game, Request $request)
    {
        $attempt = $game->getOrStart($request->user());
        $state = $game->state($attempt);
        return view('game.play', compact('state'));
    }
    public function start(CareerGameService $game, Request $request)
    {
        $attempt = $game->getOrStart($request->user());
        return response()->json($game->state($attempt));
    }
    public function answer(Request $request, CareerGameService $game)
    {
        $input = $request->validate(['attempt_id' => ['required', 'integer'], 'question_id' => ['required', 'integer'], 'answer_id' => ['required', 'integer']]);
        $attempt = CareerAttempt::findOrFail($input['attempt_id']);
        abort_unless($attempt->user_id === $request->user()->id, 403);
        return response()->json($game->answer($request->user(), $attempt, $input['question_id'], $input['answer_id']));
    }
    public function result(CareerAttempt $attempt, Request $request)
    {
        abort_unless($attempt->user_id === $request->user()->id, 403);
        abort_unless($attempt->status === 'completed', 404);
        $attempt->load('resultCareer');
        $ranking = CareerProfile::where('active', true)->get()->sortByDesc(fn ($p) => $attempt->scores[$p->slug] ?? 0)->values();
        $recommendedPaths = LearningPath::where('career_profile_id', $attempt->result_career_id)->where('published', true)
            ->where(fn ($q) => $q->whereNull('school_id')->orWhere('school_id', $request->user()->school_id))->with('stages')->get();
        return view('game.result', compact('attempt', 'ranking', 'recommendedPaths'));
    }
    public function replay(Request $request)
    {
        $request->user()->attempts()->where('status', 'in_progress')->delete();
        return redirect()->route('game.play');
    }
}
