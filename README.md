# ROTA TECH — Descubra. Jogue. Aprenda.

**Plataforma de orientação exploratória de carreiras em TI para estudantes do ensino médio.**

Laravel 13 · PHP 8.3+ · MySQL 8+ · Blade · JavaScript Canvas · CSS responsivo.

## Funcionalidades incluídas

| Área | Experiência |
| --- | --- |
| Público | Landing page, apresentação de seis carreiras e explicação das jornadas |
| Cadastro e login | Código da escola, seleção de turma dinâmica, senha protegida, animações |
| Descoberta | Jogo de plataforma **original** em Canvas 2D com movimento, salto, obstáculos, cristais, portais e controles de toque |
| Quiz | 12 situações com quatro escolhas cada, configuráveis no banco e no painel de administrador |
| Recomendação | Pontuação de afinidades no Laravel, mapa com todas as áreas e trilha recomendada |
| Trilhas | Seis trilhas de 6 fases com aulas, múltipla escolha, mini-projetos/reflexão, XP e progressão por checkpoint |
| Certificação | Certificado de participação com código de verificação pública (sem divulgação de nome completo) |
| Escola | Indicadores de participação, interesse por carreira, acompanhamentos por aluno e trilhas |
| CMS | CRUD de escolas, turmas, usuários, carreiras, perguntas, trilhas e fases com permissões por papel |
| Persistência | 15 tabelas relacionais, migrations Laravel, SQL MySQL e diagramas ER |

## Requisitos de hospedagem

- **PHP 8.3+** e extensões: `mbstring`, `pdo_mysql`, `openssl`, `fileinfo`, `ctype`, `tokenizer`, `xml`, `curl` (para Composer), `dom`, `filter`.
- **Composer 2.x** para baixar Laravel e demais dependências do projeto.
- **MySQL 8.0+** ou MariaDB compatível para uso de JSON, índices e constraints.
- Apache com `mod_rewrite` ou Nginx; document root deve apontar para a pasta **`public/`**.
- Node/NPM **não são obrigatórios**: CSS e JS estão em `public/assets` e não dependem de build.

**Importante:** este ZIP contém o código-fonte do projeto, mas não a pasta `vendor/` (bibliotecas Laravel). Rode `composer install` em ambiente com internet. Esta entrega não foi executada com um servidor Laravel/MySQL neste ambiente de geração, porque Composer e as extensões necessárias não estavam disponíveis para instalação. Faça os testes indicados antes de implantar.

## 1. Instalação local

```bash
# 1) Descompactar e entrar na pasta do projeto
cd rota_tech_laravel

# 2) Instalar dependências
composer install

# 3) Criar ambiente
cp .env.example .env
php artisan key:generate

# 4) Criar banco MySQL vazio (ou via phpMyAdmin)
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS rota_tech CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

# 5) Editar DB_HOST, DB_DATABASE, DB_USERNAME, DB_PASSWORD no .env

# 6) Criar tabelas, indices e dados iniciais
php artisan migrate --seed

# 7) Iniciar servidor
php artisan serve
```

Abra `http://127.0.0.1:8000`.

**No Windows**, utilize PowerShell com `Copy-Item .env.example .env`. Pode usar Laragon, XAMPP com PHP adequado, ou PHP/Composer instalados separadamente. O domínio deve apontar para `public/`.

### Alternativa: SQL para phpMyAdmin

O arquivo `database/schema_mysql.sql` cria o banco e as 15 tabelas **sem dados iniciais**. É uma alternativa para administrar a estrutura manualmente. Não use o SQL e `migrate` juntos na mesma base. Para dados iniciais, prefira `migrate --seed`; se importou SQL, precisará adaptar sua estratégia de seed/migration ao ambiente.

## 2. Contas de demonstração (SOMENTE local/testing)

O comando `php artisan migrate --seed` em `APP_ENV=local` cria uma escola, uma turma e três usuários fictícios para experimentar. **Nunca utilize essas contas ou senhas em ambiente público.**

| Perfil | Login | Senha inicial |
| --- | --- | --- |
| Administrador | `admin@rotateste.local` | `RotaDemo2026!` |
| Professor | `professor@rotateste.local` | `RotaDemo2026!` |
| Aluno | `aluno@rotateste.local` | `RotaDemo2026!` |

**Código de escola para novos alunos:** `ESCOLA-DEMO`.

### Como criar o primeiro admin em produção

Em um ambiente de produção, os seeds criam apenas o catálogo de trilhas/carreiras, **não** os usuários demonstrativos. Crie a conta inicial diretamente pelo Tinker em console protegido:

```bash
php artisan tinker
```

```php
\App\Models\User::create([
    'name' => 'Administrador Geral',
    'email' => 'admin@seudominio.com.br',
    'password' => 'SUBSTITUA_POR_SENHA_FORTE_UNICA',
    'role' => 'admin',
]);
```

Troque a senha de exemplo por uma senha exclusiva antes de executar. O atributo `password` é automaticamente hasheado pelo model. Em seguida, faça login e crie escolas, turmas e contas de equipe no painel.

## 3. Rotas principais

| Endereço | O que faz |
| --- | --- |
| `/` | Site inicial |
| `/cadastro` | Registro do aluno com escola e turma |
| `/entrar` | Login |
| `/painel` | Dashboard pessoal |
| `/aventura` | Jogo com checkpoints dinâmicos |
| `/aventura/resultado/{id}` | Afinidades e trilhas recomendadas |
| `/carreiras` | Explorador de perfis profissionais |
| `/trilhas/{slug}` | Mapa com fases em sequência |
| `/certificados/{id}` | Certificado imprimível/salvável como PDF |
| `/certificados/verificar/{codigo}` | Conferência pública protegendo dados pessoais |
| `/gestao` | Painel com indicadores escolares |
| `/gestao/conteudos` | Edição de escolas, turmas, contas, quiz, carreiras e trilhas |

## 4. Perfis e regras

- **Aluno:** cria conta com código escolar, joga, registra respostas, cursa fases, avalia trilhas e emite certificados.
- **Professor:** visualiza estudantes da própria escola, cadastra turmas e cria/edita trilhas vinculadas à escola. Não altera escolas alheias, catálogos globais ou contas privilegiadas.
- **Administrador:** gerencia escolas, usuários, carreiras, perguntas, trilhas e fases; acompanha indicadores.

O cadastro público **sempre** cria um estudante. A permissão `role` jamais é aceita do formulário de cadastro.

## 5. Como personalizar o quiz e as trilhas

**Quiz:** em `Gestão > Jogo`, o administrador escreve cenário, posição, escolhas e os pontos atribuídos a cada `slug` de carreira. Por exemplo:

```json
[
  {"label":"Gosto de criar páginas","scores":{"desenvolvimento-web":3,"design-ux":1},"feedback":"Legal!"},
  {"label":"Gosto de analisar dados","scores":{"dados-ia":3,"infra-cloud":1},"feedback":"Boa escolha!"}
]
```

Não existe certo/errado no teste vocacional. Os pesos são uma heurística **exploratória**, não um laudo de aptidão.

**Trilhas:** em `Gestão > Trilhas`, escolha a carreira, crie fases, configure aula, missão (`choice` ou `reflection`), pontos XP, tempo estimado e ordem. Na missão de múltipla escolha, o primeiro item tem índice **0**, o segundo **1** etc. Nas missões de projeto, o aluno escreve sua solução (mínimo 25 caracteres).

**Certificados:** aparecem automaticamente após conclusão de todas as fases, incluem um código único e podem ser impressos ou salvos como PDF pelo navegador.

## 6. Como rodar testes

Instale dependências e as extensões PHP indicadas. Os testes utilizam SQLite em memória (adicione `pdo_sqlite` no ambiente de testes):

```bash
php artisan test
# ou
composer test
```

O diretório `tests/Feature` contém testes de cadastro de aluno, isolamento de papéis, regras de avanço no jogo, emissão de certificado e autorização por escola.

## 7. Banco de dados e documentação

- `database/migrations/2026_11_11_000001_create_rota_tech_tables.php` — estrutura oficial do banco, via Laravel.
- `database/seeders/DatabaseSeeder.php` — conteúdo de demonstração com 6 carreiras, 12 perguntas, 48 escolhas, 6 trilhas, 36 fases.
- `database/schema_mysql.sql` — SQL DDL pronto para inspeção/importação separada.
- `docs/diagrama_er.png`, `.svg`, `.md` — diagrama com relacionamentos.
- `docs/ARQUITETURA.md` — arquitetura, fluxo de navegação, segurança e limites.
- `docs/IDEIAS_INOVACAO.md` — melhorias para a escola e etapas futuras.

## 8. Recomendações para operação com adolescentes

Antes de colocar em produção em escola real: configurar HTTPS e e-mails institucionais; desativar `APP_DEBUG`; retirar usuários demo; planejar a base legal e os avisos para tratamento de dados de menores, incluindo participação dos responsáveis quando aplicável; implementar recuperação de acesso, gestão de retenção/exclusão de dados, backup e monitoramento; testar o jogo com estudantes com teclado, leitor de tela e celular; e revisar pedagogicamente os pesos da afinidade.

O projeto foi pensado para **orientação educacional exploratória** e certifica **participação**. Não substitui orientação profissional humana ou avaliações psicométricas.
