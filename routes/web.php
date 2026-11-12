<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CertificateController;
use App\Http\Controllers\GameController;
use App\Http\Controllers\ManagementController;
use App\Http\Controllers\PathController;
use App\Http\Controllers\StaffController;
use App\Http\Controllers\StudentController;
use Illuminate\Support\Facades\Route;

Route::get('/', [StudentController::class, 'home'])->name('home');
Route::get('/certificados/verificar/{code}', [CertificateController::class, 'verify'])->name('certificates.verify')->where('code', '[A-Z0-9-]+');
Route::get('/escola/turmas', [AuthController::class, 'classrooms'])->middleware('throttle:30,1')->name('auth.classrooms');

Route::middleware('guest')->group(function (): void {
    Route::get('/entrar', [AuthController::class, 'loginForm'])->name('login');
    Route::post('/entrar', [AuthController::class, 'login'])->middleware('throttle:10,1')->name('login.post');
    Route::get('/cadastro', [AuthController::class, 'registerForm'])->name('register');
    Route::post('/cadastro', [AuthController::class, 'register'])->middleware('throttle:5,1')->name('register.post');
});
Route::post('/sair', [AuthController::class, 'logout'])->middleware('auth')->name('logout');

Route::middleware('auth')->group(function (): void {
    Route::get('/painel', [StudentController::class, 'dashboard'])->name('dashboard');
    Route::get('/carreiras', [StudentController::class, 'careers'])->name('careers.index');
    Route::get('/certificados/{certificate}', [CertificateController::class, 'show'])->name('certificates.show');

    Route::middleware('role:student')->group(function (): void {
        Route::get('/aventura', [GameController::class, 'index'])->name('game.play');
        Route::post('/aventura/iniciar', [GameController::class, 'start'])->middleware('throttle:30,1')->name('game.start');
        Route::post('/aventura/responder', [GameController::class, 'answer'])->middleware('throttle:40,1')->name('game.answer');
        Route::get('/aventura/resultado/{attempt}', [GameController::class, 'result'])->name('game.result');
        Route::post('/aventura/reiniciar', [GameController::class, 'replay'])->name('game.replay');
        Route::get('/trilhas/{path}', [PathController::class, 'show'])->name('paths.show');
        Route::post('/trilhas/{path}/matricular', [PathController::class, 'enroll'])->name('paths.enroll');
        Route::get('/trilhas/{path}/fases/{stage}', [PathController::class, 'stage'])->name('paths.stage');
        Route::post('/trilhas/{path}/fases/{stage}/concluir', [PathController::class, 'complete'])->middleware('throttle:35,1')->name('paths.complete');
        Route::post('/trilhas/{path}/avaliar', [PathController::class, 'feedback'])->name('paths.feedback');
    });

    Route::middleware('role:teacher,admin')->prefix('gestao')->group(function (): void {
        Route::get('/', [StaffController::class, 'dashboard'])->name('staff.dashboard');
        Route::get('/conteudos', [ManagementController::class, 'index'])->name('staff.manage');
        Route::post('/turmas/{classroom?}', [ManagementController::class, 'classroom'])->name('staff.classroom.save');
        Route::post('/trilhas/{path?}', [ManagementController::class, 'path'])->name('staff.path.save');
        Route::post('/trilhas/{path}/fases/{stage?}', [ManagementController::class, 'stage'])->name('staff.stage.save');
        Route::delete('/trilhas/{path}/fases/{stage}', [ManagementController::class, 'removeStage'])->name('staff.stage.remove');
        Route::middleware('role:admin')->group(function (): void {
            Route::post('/escolas/{school?}', [ManagementController::class, 'school'])->name('staff.school.save');
            Route::post('/usuarios/{user?}', [ManagementController::class, 'user'])->name('staff.user.save');
            Route::post('/carreiras/{career?}', [ManagementController::class, 'career'])->name('staff.career.save');
            Route::post('/perguntas/{question?}', [ManagementController::class, 'question'])->name('staff.question.save');
        });
    });
});
