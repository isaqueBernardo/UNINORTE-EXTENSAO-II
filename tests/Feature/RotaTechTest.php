<?php
namespace Tests\Feature;

use App\Models\CareerAttempt;
use App\Models\CareerAnswer;
use App\Models\CareerProfile;
use App\Models\CareerQuestion;
use App\Models\Enrollment;
use App\Models\LearningPath;
use App\Models\PathStage;
use App\Models\School;
use App\Models\StageProgress;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class RotaTechTest extends TestCase
{
    use RefreshDatabase;

    private function school(): School { return School::create(['name' => 'Escola A', 'code' => 'ESCOLA-A', 'active' => true]); }
    private function student(?School $school = null): User {
        $school ??= $this->school();
        return User::create(['name' => 'Aluno Exemplo', 'school_id' => $school->id, 'email' => uniqid('aluno').'@example.test', 'password' => 'SenhaForte123!', 'role' => 'student']);
    }
    private function catalog(): array {
        $career = CareerProfile::create(['slug' => 'frontend', 'name' => 'Web', 'description' => 'Crie sites', 'accent' => '#51ba42', 'active' => true]);
        $question = CareerQuestion::create(['title' => 'Escolha', 'scenario' => 'O que prefere?', 'position' => 1, 'active' => true]);
        $answer = CareerAnswer::create(['career_question_id' => $question->id, 'position' => 1, 'label' => 'Criar', 'scores' => ['frontend' => 3]]);
        $question->answers()->create(['position' => 2, 'label' => 'Explorar', 'scores' => ['frontend' => 1]]);
        return [$career, $question, $answer];
    }
    public function test_cadastro_publico_cria_apenas_aluno(): void {
        $school = $this->school();
        $this->post('/cadastro', ['name' => 'Maria Estudante', 'email' => 'maria@example.test', 'school_code' => $school->code, 'password' => 'SenhaSegura2026!', 'password_confirmation' => 'SenhaSegura2026!', 'privacy_ack' => '1', 'role' => 'admin'])
            ->assertRedirect('/painel');
        $this->assertDatabaseHas('users', ['email' => 'maria@example.test', 'role' => 'student', 'school_id' => $school->id]);
    }
    public function test_aluno_nao_pode_acessar_gestao(): void {
        $user = $this->student();
        $this->actingAs($user)->get('/gestao')->assertForbidden();
    }
    public function test_jogo_responde_no_servidor_e_finaliza(): void {
        [$career, $question, $answer] = $this->catalog();
        $user = $this->student();
        $this->actingAs($user)->get('/aventura')->assertOk();
        $attempt = CareerAttempt::where('user_id', $user->id)->firstOrFail();
        $this->actingAs($user)->postJson('/aventura/responder', ['attempt_id' => $attempt->id, 'question_id' => $question->id, 'answer_id' => $answer->id])
            ->assertOk()->assertJsonPath('finished', true);
        $this->assertDatabaseHas('career_attempts', ['id' => $attempt->id, 'status' => 'completed', 'result_career_id' => $career->id]);
        $this->actingAs($user)->postJson('/aventura/responder', ['attempt_id' => $attempt->id, 'question_id' => $question->id, 'answer_id' => $answer->id])->assertUnprocessable();
    }
    public function test_fases_sao_sequenciais_e_geram_certificado(): void {
        [$career] = $this->catalog();
        $user = $this->student();
        $path = LearningPath::create(['career_profile_id' => $career->id, 'slug' => 'minha-trilha', 'title' => 'Trilha Demo', 'description' => 'Descricao', 'published' => true]);
        $stage1 = $path->stages()->create(['position' => 1, 'title' => 'Primeira', 'description' => 'Inicio', 'lesson' => 'Aula', 'mission_type' => 'choice', 'mission_prompt' => 'Escolha', 'options' => ['A', 'B'], 'correct_option' => 0]);
        $stage2 = $path->stages()->create(['position' => 2, 'title' => 'Segunda', 'description' => 'Fim', 'lesson' => 'Aula', 'mission_type' => 'reflection', 'mission_prompt' => 'Sua ideia']);
        $this->actingAs($user)->post('/trilhas/minha-trilha/matricular')->assertRedirect('/trilhas/minha-trilha');
        $enroll = Enrollment::where('user_id', $user->id)->firstOrFail();
        $this->actingAs($user)->post('/trilhas/minha-trilha/fases/'.$stage2->id.'/concluir', ['answer' => 'Vou propor um projeto escolar coletivo e acessivel.'])->assertSessionHasErrors('answer');
        $this->actingAs($user)->post('/trilhas/minha-trilha/fases/'.$stage1->id.'/concluir', ['answer' => '0'])->assertRedirect('/trilhas/minha-trilha');
        $this->actingAs($user)->post('/trilhas/minha-trilha/fases/'.$stage2->id.'/concluir', ['answer' => 'Vou propor um projeto escolar coletivo e acessivel.'])->assertRedirect('/trilhas/minha-trilha');
        $this->assertDatabaseHas('certificates', ['enrollment_id' => $enroll->id, 'user_id' => $user->id]);
    }
    public function test_professor_nao_edita_trilha_de_outra_escola(): void {
        [$career] = $this->catalog();
        $school1 = $this->school();
        $school2 = School::create(['name' => 'Escola B', 'code' => 'ESCOLA-B']);
        $teacher = User::create(['name' => 'Professor', 'email' => 'professor@example.test', 'school_id' => $school1->id, 'role' => 'teacher', 'password' => 'SenhaForte123!']);
        $path = LearningPath::create(['career_profile_id' => $career->id, 'school_id' => $school2->id, 'slug' => 'privada-b', 'title' => 'Privada', 'description' => 'Escola B']);
        $this->actingAs($teacher)->post('/gestao/trilhas/privada-b', ['career_profile_id' => $career->id, 'title' => 'Alterada', 'description' => 'Alteracao', 'estimated_minutes' => 90, 'school_id' => $school1->id, 'published' => 1])->assertForbidden();
    }
}
