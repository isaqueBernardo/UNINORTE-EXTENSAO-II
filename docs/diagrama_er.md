# Diagrama entidade-relacionamento — Rota Tech

As relações são implementadas por **foreign keys** nas migrations Laravel e no arquivo `database/schema_mysql.sql`. O conteúdo dos cursos e as escolhas do quiz são persistidos e administráveis, e a segregação institucional ocorre por `school_id`.

```mermaid
erDiagram
    SCHOOLS ||--o{ CLASSROOMS : organiza
    SCHOOLS ||--o{ USERS : vincula
    SCHOOLS ||--o{ LEARNING_PATHS : personaliza
    CLASSROOMS ||--o{ USERS : matricula
    USERS ||--o{ CAREER_ATTEMPTS : joga
    CAREER_ATTEMPTS ||--o{ CAREER_RESPONSES : registra
    CAREER_QUESTIONS ||--o{ CAREER_ANSWERS : oferece
    CAREER_QUESTIONS ||--o{ CAREER_RESPONSES : recebe
    CAREER_ANSWERS ||--o{ CAREER_RESPONSES : escolhida
    CAREER_PROFILES ||--o{ CAREER_ATTEMPTS : recomenda
    CAREER_PROFILES ||--o{ LEARNING_PATHS : orienta
    LEARNING_PATHS ||--o{ PATH_STAGES : contem
    USERS ||--o{ ENROLLMENTS : inicia
    LEARNING_PATHS ||--o{ ENROLLMENTS : recebe
    ENROLLMENTS ||--o{ STAGE_PROGRESS : avanca
    PATH_STAGES ||--o{ STAGE_PROGRESS : concluida
    ENROLLMENTS ||--o| CERTIFICATES : certifica
    USERS ||--o{ CERTIFICATES : conquista
    USERS ||--o{ FEEDBACK : avalia
    LEARNING_PATHS ||--o{ FEEDBACK : recebe

    SCHOOLS { bigint id PK string code UK string name boolean active }
    CLASSROOMS { bigint id PK bigint school_id FK string name string school_year }
    USERS { bigint id PK bigint school_id FK bigint classroom_id FK string email UK string role int xp }
    CAREER_PROFILES { bigint id PK string slug UK string name json skills boolean active }
    CAREER_QUESTIONS { bigint id PK int position string title boolean active }
    CAREER_ANSWERS { bigint id PK bigint career_question_id FK string label json scores }
    CAREER_ATTEMPTS { bigint id PK bigint user_id FK bigint result_career_id FK json question_ids json scores string status }
    CAREER_RESPONSES { bigint id PK bigint career_attempt_id FK bigint career_question_id FK bigint career_answer_id FK }
    LEARNING_PATHS { bigint id PK bigint career_profile_id FK bigint school_id FK string slug UK boolean published }
    PATH_STAGES { bigint id PK bigint learning_path_id FK int position string mission_type json options }
    ENROLLMENTS { bigint id PK bigint user_id FK bigint learning_path_id FK datetime completed_at }
    STAGE_PROGRESS { bigint id PK bigint enrollment_id FK bigint path_stage_id FK text answer datetime completed_at }
    CERTIFICATES { bigint id PK bigint user_id FK bigint enrollment_id FK string verification_code UK datetime issued_at }
    FEEDBACK { bigint id PK bigint user_id FK bigint learning_path_id FK int rating }
```

## Principais regras

- Um aluno pertence a uma escola e pode ser associado a uma turma.
- As perguntas guardam as opções e os pesos de afinidade para cada carreira em JSON. A seleção é calculada no servidor.
- Uma partida registra a ordem das perguntas quando começa (`question_ids`), evitando que reordenação posterior mude a sequência.
- Uma matrícula é exclusiva por `user_id` e `learning_path_id`.
- A fase só pode ser concluída se for a próxima fase desbloqueada e a resposta passar na validação do Laravel.
- Só se emite certificado quando todas as fases estão concluídas.
- Professores administram turmas e trilhas da própria escola. O administrador gerencia os catálogos globais.
