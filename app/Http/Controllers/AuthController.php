<?php
namespace App\Http\Controllers;

use App\Models\Classroom;
use App\Models\School;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function loginForm() { return view('auth.login'); }
    public function registerForm() { return view('auth.register'); }

    public function login(Request $request)
    {
        $data = $request->validate(['email' => ['required', 'email'], 'password' => ['required', 'string']]);
        $key = 'login:'.sha1(mb_strtolower($data['email']).'|'.$request->ip());
        if (RateLimiter::tooManyAttempts($key, 5)) {
            throw ValidationException::withMessages(['email' => 'Muitas tentativas. Tente novamente em '.RateLimiter::availableIn($key).' segundos.']);
        }
        if (!Auth::attempt(['email' => $data['email'], 'password' => $data['password'], 'is_active' => true], $request->boolean('remember'))) {
            RateLimiter::hit($key, 60);
            throw ValidationException::withMessages(['email' => 'Dados de acesso incorretos.']);
        }
        RateLimiter::clear($key);
        $request->session()->regenerate();
        return redirect()->intended(route('dashboard'))->with('success', 'Que bom ter voce de volta!');
    }

    public function register(Request $request)
    {
        $data = $request->validate([
            'name' => ['required', 'string', 'min:3', 'max:120'],
            'email' => ['required', 'email', 'max:190', 'unique:users,email'],
            'password' => ['required', 'string', 'min:10', 'confirmed'],
            'school_code' => ['required', 'string', 'max:20'],
            'classroom_id' => ['nullable', 'integer'],
            'privacy_ack' => ['accepted'],
        ]);
        $school = School::where('code', strtoupper(trim($data['school_code'])))->where('active', true)->first();
        if (!$school) throw ValidationException::withMessages(['school_code' => 'Codigo escolar nao encontrado. Solicite-o a sua escola.']);
        $classroom = null;
        if (!empty($data['classroom_id'])) {
            $classroom = Classroom::where('school_id', $school->id)->find($data['classroom_id']);
            if (!$classroom) throw ValidationException::withMessages(['classroom_id' => 'Turma invalida para esta escola.']);
        }
        $user = User::create([
            'name' => trim($data['name']), 'email' => mb_strtolower($data['email']), 'password' => $data['password'],
            'school_id' => $school->id, 'classroom_id' => $classroom?->id, 'role' => 'student',
        ]);
        Auth::login($user);
        $request->session()->regenerate();
        return redirect()->route('dashboard')->with('success', 'Seu avatar ja pode comecar a aventura!');
    }

    public function classrooms(Request $request)
    {
        $school = School::where('code', strtoupper(trim((string) $request->query('code'))))->where('active', true)->first();
        if (!$school) return response()->json(['name' => null, 'classrooms' => []]);
        return response()->json(['name' => $school->name, 'classrooms' => $school->classrooms()->orderBy('name')->get(['id', 'name', 'school_year'])]);
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('home');
    }
}
