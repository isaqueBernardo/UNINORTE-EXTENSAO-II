<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Estrutura escolar e acesso segregado por escola.
        Schema::create('schools', function (Blueprint $table): void {
            $table->id();
            $table->string('name', 160);
            $table->string('code', 20)->unique();
            $table->string('city', 100)->nullable();
            $table->string('state', 2)->nullable();
            $table->boolean('active')->default(true);
            $table->timestamps();
        });
        Schema::create('classrooms', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('school_id')->constrained()->cascadeOnDelete();
            $table->string('name', 80);
            $table->string('school_year', 9);
            $table->timestamps();
            $table->unique(['school_id', 'name', 'school_year']);
        });
        Schema::create('users', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('school_id')->nullable()->constrained()->nullOnDelete();
            $table->foreignId('classroom_id')->nullable()->constrained()->nullOnDelete();
            $table->string('name', 120);
            $table->string('email', 190)->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->enum('role', ['student', 'teacher', 'admin'])->default('student');
            $table->unsignedInteger('xp')->default(0);
            $table->boolean('is_active')->default(true);
            $table->rememberToken();
            $table->timestamps();
            $table->index(['school_id', 'role']);
        });
        Schema::create('password_reset_tokens', function (Blueprint $table): void {
            $table->string('email')->primary();
            $table->string('token');
            $table->timestamp('created_at')->nullable();
        });

        // Catálogo vocacional e perguntas editáveis.
        Schema::create('career_profiles', function (Blueprint $table): void {
            $table->id();
            $table->string('slug', 100)->unique();
            $table->string('name', 120);
            $table->text('description');
            $table->string('icon', 40)->default('code');
            $table->string('accent', 7)->default('#51BA42');
            $table->json('skills')->nullable();
            $table->json('starter_projects')->nullable();
            $table->boolean('active')->default(true);
            $table->timestamps();
        });
        Schema::create('career_questions', function (Blueprint $table): void {
            $table->id();
            $table->string('title', 180);
            $table->text('scenario');
            $table->string('category', 80)->default('desafio');
            $table->unsignedSmallInteger('position')->unique();
            $table->boolean('active')->default(true);
            $table->timestamps();
        });
        Schema::create('career_answers', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('career_question_id')->constrained()->cascadeOnDelete();
            $table->string('label', 240);
            $table->json('scores'); // {"desenvolvimento-web":3,"dados-ia":1}
            $table->string('feedback', 240)->nullable();
            $table->unsignedTinyInteger('position')->default(1);
            $table->timestamps();
        });
        Schema::create('career_attempts', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('user_id')->constrained()->cascadeOnDelete();
            $table->enum('status', ['in_progress', 'completed'])->default('in_progress');
            $table->foreignId('result_career_id')->nullable()->constrained('career_profiles')->nullOnDelete();
            $table->json('scores')->nullable();
            $table->json('question_ids')->nullable(); // ordem congelada ao iniciar uma partida
            $table->timestamp('completed_at')->nullable();
            $table->timestamps();
            $table->index(['user_id', 'status']);
        });
        Schema::create('career_responses', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('career_attempt_id')->constrained()->cascadeOnDelete();
            $table->foreignId('career_question_id')->constrained()->cascadeOnDelete();
            $table->foreignId('career_answer_id')->constrained()->cascadeOnDelete();
            $table->timestamps();
            $table->unique(['career_attempt_id', 'career_question_id'], 'unique_answer_per_attempt');
        });

        // Trilhas, etapas, matrículas e certificados verificáveis.
        Schema::create('learning_paths', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('career_profile_id')->constrained()->cascadeOnDelete();
            $table->foreignId('school_id')->nullable()->constrained()->cascadeOnDelete();
            $table->string('slug', 140)->unique();
            $table->string('title', 160);
            $table->text('description');
            $table->unsignedSmallInteger('estimated_minutes')->default(90);
            $table->boolean('published')->default(true);
            $table->timestamps();
        });
        Schema::create('path_stages', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('learning_path_id')->constrained()->cascadeOnDelete();
            $table->unsignedSmallInteger('position');
            $table->string('title', 150);
            $table->text('description');
            $table->longText('lesson');
            $table->enum('mission_type', ['choice', 'reflection'])->default('choice');
            $table->text('mission_prompt');
            $table->json('options')->nullable();
            $table->unsignedTinyInteger('correct_option')->nullable();
            $table->unsignedSmallInteger('xp_reward')->default(60);
            $table->unsignedSmallInteger('estimated_minutes')->default(15);
            $table->timestamps();
            $table->unique(['learning_path_id', 'position']);
        });
        Schema::create('enrollments', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('user_id')->constrained()->cascadeOnDelete();
            $table->foreignId('learning_path_id')->constrained()->cascadeOnDelete();
            $table->timestamp('completed_at')->nullable();
            $table->timestamps();
            $table->unique(['user_id', 'learning_path_id']);
        });
        Schema::create('stage_progress', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('enrollment_id')->constrained()->cascadeOnDelete();
            $table->foreignId('path_stage_id')->constrained()->cascadeOnDelete();
            $table->text('answer')->nullable();
            $table->unsignedSmallInteger('attempts')->default(0);
            $table->timestamp('completed_at')->nullable();
            $table->timestamps();
            $table->unique(['enrollment_id', 'path_stage_id']);
        });
        Schema::create('certificates', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('user_id')->constrained()->cascadeOnDelete();
            $table->foreignId('enrollment_id')->unique()->constrained()->cascadeOnDelete();
            $table->string('verification_code', 40)->unique();
            $table->timestamp('issued_at');
            $table->timestamps();
        });
        Schema::create('feedback', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('user_id')->constrained()->cascadeOnDelete();
            $table->foreignId('learning_path_id')->constrained()->cascadeOnDelete();
            $table->unsignedTinyInteger('rating');
            $table->string('comment', 400)->nullable();
            $table->timestamps();
            $table->unique(['user_id', 'learning_path_id']);
        });
    }

    public function down(): void
    {
        foreach (['feedback', 'certificates', 'stage_progress', 'enrollments', 'path_stages', 'learning_paths', 'career_responses', 'career_attempts', 'career_answers', 'career_questions', 'career_profiles', 'password_reset_tokens', 'users', 'classrooms', 'schools'] as $table) {
            Schema::dropIfExists($table);
        }
    }
};
