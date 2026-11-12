-- ROTA TECH | MySQL 8.0+ | banco completo (estrutura sem dados demonstrativos)
-- RECOMENDADO: use `php artisan migrate --seed` para manter controle de versoes.
-- ALTERNATIVA: importar este arquivo manualmente no phpMyAdmin/MySQL.
-- Nao importe schema_mysql.sql E rode as migracoes na mesma base vazia (duplicaria tabelas).
-- Charset completo para nomes, acentos e emojis em conteudos escolares.
CREATE DATABASE IF NOT EXISTS rota_tech CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE rota_tech;
SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS schools (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(160) NOT NULL,
 code VARCHAR(20) NOT NULL UNIQUE,
 city VARCHAR(100) NULL, state VARCHAR(2) NULL, active TINYINT(1) NOT NULL DEFAULT 1,
 created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS classrooms (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 school_id BIGINT UNSIGNED NOT NULL,
 name VARCHAR(80) NOT NULL, school_year VARCHAR(9) NOT NULL,
 created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
 UNIQUE KEY uq_school_class_year (school_id,name,school_year),
 CONSTRAINT fk_classrooms_school FOREIGN KEY (school_id) REFERENCES schools(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS users (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 school_id BIGINT UNSIGNED NULL, classroom_id BIGINT UNSIGNED NULL,
 name VARCHAR(120) NOT NULL, email VARCHAR(190) NOT NULL UNIQUE,
 email_verified_at TIMESTAMP NULL, password VARCHAR(255) NOT NULL,
 role ENUM('student','teacher','admin') NOT NULL DEFAULT 'student',
 xp INT UNSIGNED NOT NULL DEFAULT 0, is_active TINYINT(1) NOT NULL DEFAULT 1,
 remember_token VARCHAR(100) NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
 INDEX ix_user_school_role(school_id,role),
 CONSTRAINT fk_users_school FOREIGN KEY (school_id) REFERENCES schools(id) ON DELETE SET NULL,
 CONSTRAINT fk_users_classroom FOREIGN KEY (classroom_id) REFERENCES classrooms(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS password_reset_tokens (
 email VARCHAR(190) PRIMARY KEY, token VARCHAR(255) NOT NULL, created_at TIMESTAMP NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS career_profiles (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 slug VARCHAR(100) NOT NULL UNIQUE, name VARCHAR(120) NOT NULL,
 description TEXT NOT NULL, icon VARCHAR(40) NOT NULL DEFAULT 'code',
 accent VARCHAR(7) NOT NULL DEFAULT '#51BA42',
 skills JSON NULL, starter_projects JSON NULL, active TINYINT(1) NOT NULL DEFAULT 1,
 created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS career_questions (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 title VARCHAR(180) NOT NULL, scenario TEXT NOT NULL,
 category VARCHAR(80) NOT NULL DEFAULT 'desafio',
 position SMALLINT UNSIGNED NOT NULL UNIQUE,
 active TINYINT(1) NOT NULL DEFAULT 1,
 created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS career_answers (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 career_question_id BIGINT UNSIGNED NOT NULL,
 label VARCHAR(240) NOT NULL, scores JSON NOT NULL,
 feedback VARCHAR(240) NULL, position TINYINT UNSIGNED NOT NULL DEFAULT 1,
 created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
 INDEX ix_answers_question(career_question_id),
 CONSTRAINT fk_answers_question FOREIGN KEY (career_question_id) REFERENCES career_questions(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS career_attempts (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 user_id BIGINT UNSIGNED NOT NULL,
 status ENUM('in_progress','completed') NOT NULL DEFAULT 'in_progress',
 result_career_id BIGINT UNSIGNED NULL,
 scores JSON NULL, question_ids JSON NULL,
 completed_at TIMESTAMP NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
 INDEX ix_attempt_user_status(user_id,status),
 CONSTRAINT fk_attempt_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
 CONSTRAINT fk_attempt_result FOREIGN KEY (result_career_id) REFERENCES career_profiles(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS career_responses (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 career_attempt_id BIGINT UNSIGNED NOT NULL,
 career_question_id BIGINT UNSIGNED NOT NULL,
 career_answer_id BIGINT UNSIGNED NOT NULL,
 created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
 UNIQUE KEY unique_answer_per_attempt(career_attempt_id, career_question_id),
 INDEX ix_responses_question(career_question_id), INDEX ix_responses_answer(career_answer_id),
 CONSTRAINT fk_response_attempt FOREIGN KEY (career_attempt_id) REFERENCES career_attempts(id) ON DELETE CASCADE,
 CONSTRAINT fk_response_question FOREIGN KEY (career_question_id) REFERENCES career_questions(id) ON DELETE CASCADE,
 CONSTRAINT fk_response_answer FOREIGN KEY (career_answer_id) REFERENCES career_answers(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS learning_paths (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 career_profile_id BIGINT UNSIGNED NOT NULL,
 school_id BIGINT UNSIGNED NULL,
 slug VARCHAR(140) NOT NULL UNIQUE,
 title VARCHAR(160) NOT NULL, description TEXT NOT NULL,
 estimated_minutes SMALLINT UNSIGNED NOT NULL DEFAULT 90,
 published TINYINT(1) NOT NULL DEFAULT 1,
 created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
 INDEX ix_paths_career(career_profile_id), INDEX ix_paths_school(school_id),
 CONSTRAINT fk_paths_career FOREIGN KEY (career_profile_id) REFERENCES career_profiles(id) ON DELETE CASCADE,
 CONSTRAINT fk_paths_school FOREIGN KEY (school_id) REFERENCES schools(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS path_stages (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 learning_path_id BIGINT UNSIGNED NOT NULL,
 position SMALLINT UNSIGNED NOT NULL,
 title VARCHAR(150) NOT NULL, description TEXT NOT NULL, lesson LONGTEXT NOT NULL,
 mission_type ENUM('choice','reflection') NOT NULL DEFAULT 'choice',
 mission_prompt TEXT NOT NULL, options JSON NULL, correct_option TINYINT UNSIGNED NULL,
 xp_reward SMALLINT UNSIGNED NOT NULL DEFAULT 60,
 estimated_minutes SMALLINT UNSIGNED NOT NULL DEFAULT 15,
 created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
 UNIQUE KEY uq_path_stage_order (learning_path_id,position),
 CONSTRAINT fk_stages_path FOREIGN KEY (learning_path_id) REFERENCES learning_paths(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS enrollments (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 user_id BIGINT UNSIGNED NOT NULL, learning_path_id BIGINT UNSIGNED NOT NULL,
 completed_at TIMESTAMP NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
 UNIQUE KEY uq_enrollment(user_id,learning_path_id), INDEX ix_enrollment_path(learning_path_id),
 CONSTRAINT fk_enrollment_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
 CONSTRAINT fk_enrollment_path FOREIGN KEY (learning_path_id) REFERENCES learning_paths(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS stage_progress (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 enrollment_id BIGINT UNSIGNED NOT NULL,
 path_stage_id BIGINT UNSIGNED NOT NULL,
 answer TEXT NULL, attempts SMALLINT UNSIGNED NOT NULL DEFAULT 0,
 completed_at TIMESTAMP NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
 UNIQUE KEY uq_stage_progress(enrollment_id,path_stage_id),INDEX ix_progress_stage(path_stage_id),
 CONSTRAINT fk_progress_enrollment FOREIGN KEY (enrollment_id) REFERENCES enrollments(id) ON DELETE CASCADE,
 CONSTRAINT fk_progress_stage FOREIGN KEY (path_stage_id) REFERENCES path_stages(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS certificates (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 user_id BIGINT UNSIGNED NOT NULL, enrollment_id BIGINT UNSIGNED NOT NULL UNIQUE,
 verification_code VARCHAR(40) NOT NULL UNIQUE, issued_at TIMESTAMP NOT NULL,
 created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
 INDEX ix_certificate_user(user_id),
 CONSTRAINT fk_cert_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
 CONSTRAINT fk_cert_enrollment FOREIGN KEY (enrollment_id) REFERENCES enrollments(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS feedback (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 user_id BIGINT UNSIGNED NOT NULL, learning_path_id BIGINT UNSIGNED NOT NULL,
 rating TINYINT UNSIGNED NOT NULL, comment VARCHAR(400) NULL,
 created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
 UNIQUE KEY uq_feedback(user_id,learning_path_id),INDEX ix_feedback_path(learning_path_id),
 CONSTRAINT fk_feedback_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
 CONSTRAINT fk_feedback_path FOREIGN KEY (learning_path_id) REFERENCES learning_paths(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
