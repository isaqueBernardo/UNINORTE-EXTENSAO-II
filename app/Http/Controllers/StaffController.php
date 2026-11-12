<?php
namespace App\Http\Controllers;

use App\Models\CareerAttempt;
use App\Models\Certificate;
use App\Models\Classroom;
use App\Models\Enrollment;
use App\Models\LearningPath;
use App\Models\School;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StaffController extends Controller
{
    public function dashboard(Request $request)
    {
        $user = $request->user();
        abort_if($user->role === 'teacher' && !$user->school_id, 403, 'Professor sem escola vinculada.');
        $schoolId = $user->role === 'teacher' ? $user->school_id : ($request->integer('school_id') ?: null);
        $students = User::where('role', 'student')->when($schoolId, fn ($q) => $q->where('school_id', $schoolId));
        $studentIds = (clone $students)->select('id');
        $stats = [
            'students' => (clone $students)->count(),
            'discoveries' => CareerAttempt::whereIn('user_id', $studentIds)->where('status', 'completed')->distinct('user_id')->count('user_id'),
            'enrollments' => Enrollment::whereIn('user_id', $studentIds)->count(),
            'certificates' => Certificate::whereIn('user_id', $studentIds)->count(),
        ];
        $profiles = CareerAttempt::join('career_profiles', 'career_attempts.result_career_id', '=', 'career_profiles.id')
            ->join('users', 'users.id', '=', 'career_attempts.user_id')
            ->where('career_attempts.status', 'completed')->when($schoolId, fn ($q) => $q->where('users.school_id', $schoolId))
            ->select('career_profiles.name', DB::raw('COUNT(*) as total'))->groupBy('career_profiles.id', 'career_profiles.name')->orderByDesc('total')->get();
        $classrooms = Classroom::when($schoolId, fn ($q) => $q->where('school_id', $schoolId))->orderBy('name')->get();
        $schools = $user->role === 'admin' ? School::orderBy('name')->get() : collect();
        $studentsList = (clone $students)->with(['classroom'])->withCount(['attempts as completed_attempts_count' => fn ($q) => $q->where('status', 'completed'), 'certificates'])->orderBy('name')->paginate(15)->withQueryString();
        $paths = LearningPath::when($schoolId, fn ($q) => $q->where(fn ($p) => $p->whereNull('school_id')->orWhere('school_id', $schoolId)))
            ->withCount(['enrollments' => fn ($q) => $q->when($schoolId, fn ($enr) => $enr->whereHas('user', fn ($u) => $u->where('school_id', $schoolId)))])->get();
        return view('admin.dashboard', compact('stats', 'profiles', 'classrooms', 'studentsList', 'paths', 'schoolId', 'schools'));
    }
}
