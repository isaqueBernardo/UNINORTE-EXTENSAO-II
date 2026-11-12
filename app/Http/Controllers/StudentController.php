<?php
namespace App\Http\Controllers;

use App\Models\CareerAttempt;
use App\Models\CareerProfile;
use App\Models\LearningPath;
use App\Models\Certificate;
use Illuminate\Http\Request;

class StudentController extends Controller
{
    public function home()
    {
        $careers = CareerProfile::where('active', true)->withCount('paths')->get();
        return view('home', compact('careers'));
    }

    public function dashboard(Request $request)
    {
        if ($request->user()->isStaff()) return redirect()->route('staff.dashboard');
        $user = $request->user();
        $attempt = $user->attempts()->where('status', 'completed')->with('resultCareer')->latest('id')->first();
        $enrollments = $user->enrollments()->with(['path.career', 'path.stages', 'progress'])->latest()->get();
        $certificates = $user->certificates()->with('enrollment.path')->latest()->get();
        $suggestions = LearningPath::where('published', true)
            ->where(fn ($q) => $q->whereNull('school_id')->orWhere('school_id', $user->school_id))
            ->when($attempt, fn ($q) => $q->orderByRaw('career_profile_id = ? DESC', [$attempt->result_career_id]))
            ->with('career')->take(6)->get();
        return view('student.dashboard', compact('user', 'attempt', 'enrollments', 'certificates', 'suggestions'));
    }

    public function careers(Request $request)
    {
        $careers = CareerProfile::where('active', true)->with(['paths' => fn ($q) => $q->where('published', true)->where(fn ($p) => $p->whereNull('school_id')->orWhere('school_id', $request->user()->school_id))])->get();
        return view('student.careers', compact('careers'));
    }
}
