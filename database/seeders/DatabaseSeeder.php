<?php
namespace Database\Seeders;

use App\Models\CareerProfile;
use App\Models\CareerQuestion;
use App\Models\Classroom;
use App\Models\LearningPath;
use App\Models\School;
use App\Models\User;
use Illuminate\Database\Seeder;

/** Conteudo demonstrativo editavel pelo painel; dados pessoais ficticios apenas no ambiente local. */
class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $careers = [
            ['desenvolvimento-web', 'Desenvolvimento Web', 'Crie sites e aplicativos que ajudam pessoas a resolver problemas cotidianos.', 'code-2', '#51BA42', ['HTML', 'CSS', 'JavaScript', 'acessibilidade'], ['Pagina de uma feira de ciencias', 'Site de acolhimento de alunos novos']],
            ['ciberseguranca', 'Seguranca Digital', 'Proteja informacoes, reconheca riscos e aprenda a tornar a internet mais segura.', 'shield-check', '#6EC8EE', ['senhas fortes', 'privacidade', 'redes', 'etica digital'], ['Campanha contra golpes online', 'Checklist de seguranca do laboratorio']],
            ['dados-ia', 'Dados e Inteligencia Artificial', 'Transforme perguntas em analises, graficos e descobertas responsaveis.', 'chart-no-axes-combined', '#AE9CFF', ['planilhas', 'pensamento critico', 'graficos', 'IA responsavel'], ['Mapa de habitos de estudo', 'Pesquisa sobre mobilidade escolar']],
            ['design-ux', 'Design UX/UI', 'Planeje experiencias digitais simples, inclusivas e agradaveis de usar.', 'palette', '#FFB973', ['empatia', 'prototipacao', 'pesquisa', 'design acessivel'], ['Protótipo de aplicativo escolar', 'Redesenho de cartaz de evento']],
            ['jogos-digitais', 'Desenvolvimento de Jogos', 'Misture narrativa, programacao e criatividade para construir mundos interativos.', 'gamepad-2', '#F48CAF', ['logica', 'mecanicas', 'arte 2D', 'testes'], ['Minijogo sobre reciclagem', 'Jogo de perguntas da biblioteca']],
            ['infra-cloud', 'Infraestrutura e Nuvem', 'Faca os sistemas funcionarem: redes, servicos, servidores e trabalho em equipe.', 'cloud', '#58D1C8', ['redes', 'servidores', 'monitoramento', 'organizacao'], ['Mapa da rede da escola', 'Plano de backup para projeto escolar']],
        ];
        foreach ($careers as [$slug, $name, $desc, $icon, $accent, $skills, $projects]) {
            CareerProfile::updateOrCreate(['slug' => $slug], [
                'name' => $name, 'description' => $desc, 'icon' => $icon, 'accent' => $accent,
                'skills' => $skills, 'starter_projects' => $projects, 'active' => true,
            ]);
        }

        // Cada escolha pode pontuar multiplas areas; nao ha respostas 'erradas' na descoberta.
        $questions = [
            ['Uma novidade chega na escola', 'A escola recebeu um laboratorio novo. Qual seria sua primeira contribuicao?', [
                ['Criar uma pagina para mostrar os projetos', 'desenvolvimento-web', 'design-ux'],
                ['Verificar como proteger as contas', 'ciberseguranca', 'infra-cloud'],
                ['Pesquisar como os alunos usariam o laboratorio', 'dados-ia', 'design-ux'],
                ['Inventar um desafio interativo de inauguracao', 'jogos-digitais', 'desenvolvimento-web'],
            ]],
            ['O misterio do recreio', 'Muitos alunos reclamam da fila da cantina. Voce...', [
                ['Desenha um aplicativo de pedidos simples', 'design-ux', 'desenvolvimento-web'],
                ['Analisa horarios e tamanho das filas', 'dados-ia', 'infra-cloud'],
                ['Cria um jogo para ensinar organizacao de filas', 'jogos-digitais', 'design-ux'],
                ['Propõe uma forma segura de registrar pedidos', 'ciberseguranca', 'desenvolvimento-web'],
            ]],
            ['Missao: internet caiu!', 'Durante uma apresentacao, a conexao para de funcionar. Voce...', [
                ['Investiga o roteador e as conexoes', 'infra-cloud', 'ciberseguranca'],
                ['Prepara uma versao offline da pagina', 'desenvolvimento-web', 'infra-cloud'],
                ['Pensa em uma experiencia alternativa para o publico', 'design-ux', 'jogos-digitais'],
                ['Registra quando acontece para identificar padroes', 'dados-ia', 'infra-cloud'],
            ]],
            ['Cuidado com um link estranho', 'Um colega recebeu uma mensagem suspeita. Como voce ajuda?', [
                ['Confiro origem, dominio e possiveis riscos', 'ciberseguranca', 'infra-cloud'],
                ['Produzo uma pagina de alerta educativo', 'desenvolvimento-web', 'design-ux'],
                ['Transformo as dicas em quiz interativo', 'jogos-digitais', 'ciberseguranca'],
                ['Analiso tipos de golpes mais comuns', 'dados-ia', 'ciberseguranca'],
            ]],
            ['Uma ideia para a feira', 'Seu grupo precisa apresentar um tema de ciencias. O que anima voce?', [
                ['Construir um site que a turma possa explorar', 'desenvolvimento-web', 'design-ux'],
                ['Fazer um simulador com escolhas e pontuacao', 'jogos-digitais', 'desenvolvimento-web'],
                ['Coletar dados e mostrar um grafico interessante', 'dados-ia', 'design-ux'],
                ['Planejar os equipamentos e a conectividade', 'infra-cloud', 'ciberseguranca'],
            ]],
            ['O desafio do aplicativo', 'Um app escolar recebe queixas de que e dificil usar. Voce...', [
                ['Conversa com alunos e cria novas telas', 'design-ux', 'desenvolvimento-web'],
                ['Corrige o codigo que faz as paginas travarem', 'desenvolvimento-web', 'infra-cloud'],
                ['Estuda metricas de uso e abandono', 'dados-ia', 'design-ux'],
                ['Testa riscos de acesso indevido', 'ciberseguranca', 'infra-cloud'],
            ]],
            ['Trabalho em equipe', 'Em um projeto de tecnologia, qual papel combina com voce?', [
                ['Conectar as pecas e montar uma solucao', 'desenvolvimento-web', 'infra-cloud'],
                ['Investigar erros e preservar a seguranca', 'ciberseguranca', 'dados-ia'],
                ['Escutar ideias e criar algo intuitivo', 'design-ux', 'jogos-digitais'],
                ['Descobrir o que os numeros estao dizendo', 'dados-ia', 'infra-cloud'],
            ]],
            ['Um jogo educativo', 'A escola quer um jogo sobre sustentabilidade. Voce se empolga com...', [
                ['Criar personagem, fases e recompensas', 'jogos-digitais', 'design-ux'],
                ['Programar o placar e as regras', 'desenvolvimento-web', 'jogos-digitais'],
                ['Testar se os dados de desempenho fazem sentido', 'dados-ia', 'jogos-digitais'],
                ['Garantir que cada conta seja protegida', 'ciberseguranca', 'infra-cloud'],
            ]],
            ['Uma pesquisa surpreendente', 'Uma pesquisa na escola aponta resultados inesperados. Voce...', [
                ['Verifica dados e procura explicacoes', 'dados-ia', 'ciberseguranca'],
                ['Desenha um infografico facil de entender', 'design-ux', 'dados-ia'],
                ['Cria uma pagina para divulgar as descobertas', 'desenvolvimento-web', 'dados-ia'],
                ['Pensa em um jogo para explorar os resultados', 'jogos-digitais', 'design-ux'],
            ]],
            ['A escola do futuro', 'Se pudesse melhorar um ponto da sua escola com tecnologia...', [
                ['Criaria um portal para os estudantes', 'desenvolvimento-web', 'design-ux'],
                ['Deixaria os sistemas confiaveis e disponiveis', 'infra-cloud', 'ciberseguranca'],
                ['Usaria dados para planejar melhorias', 'dados-ia', 'infra-cloud'],
                ['Criaria uma experiencia divertida de aprendizagem', 'jogos-digitais', 'design-ux'],
            ]],
            ['Uma grande descoberta', 'Qual tipo de resultado mais faria voce comemorar?', [
                ['Um programa criado por mim funcionando', 'desenvolvimento-web', 'jogos-digitais'],
                ['Um risco digital que ajudei a impedir', 'ciberseguranca', 'infra-cloud'],
                ['Uma conclusao interessante encontrada nos dados', 'dados-ia', 'design-ux'],
                ['Pessoas achando um produto facil e divertido', 'design-ux', 'jogos-digitais'],
            ]],
            ['Escolha sua proxima missao', 'Com mais uma tarde livre para explorar tecnologia, voce...', [
                ['Criaria paginas e experimentaria codigo', 'desenvolvimento-web', 'design-ux'],
                ['Montaria e entenderia redes e computadores', 'infra-cloud', 'ciberseguranca'],
                ['Inventaria um mundo jogavel e suas regras', 'jogos-digitais', 'design-ux'],
                ['Testaria hipoteses com uma planilha de dados', 'dados-ia', 'ciberseguranca'],
            ]],
        ];
        foreach ($questions as $i => [$title, $scenario, $answers]) {
            $question = CareerQuestion::updateOrCreate(['position' => $i + 1], ['title' => $title, 'scenario' => $scenario, 'category' => ($i % 3 === 0 ? 'exploracao' : 'desafio'), 'active' => true]);
            if (!$question->answers()->exists()) {
                foreach ($answers as $j => [$label, $primary, $secondary]) {
                    $question->answers()->create(['label' => $label, 'scores' => [$primary => 3, $secondary => 1], 'feedback' => 'Boa escolha! Essa habilidade aparece em varias profissões de tecnologia.', 'position' => $j + 1]);
                }
            }
        }

        $modules = [
            'desenvolvimento-web' => [
                ['Como a web funciona', 'Uma pagina e formada por conteudo, estilo e comportamento.', 'HTML organiza o conteudo, CSS cuida do visual e JavaScript cria interacao. O navegador interpreta esses arquivos e mostra a pagina. Uma boa web tambem precisa funcionar em celular e com tecnologias assistivas.', 'Qual linguagem estrutura os titulos e paragrafos de uma pagina?', ['HTML', 'SQL', 'Python'], 0],
                ['Uma pagina para todos', 'Inclusao digital começa no planejamento.', 'Textos legiveis, contraste adequado, navegacao por teclado e descricoes de imagens ajudam mais pessoas a acessar conteudos. Acessibilidade nao e um recurso opcional: faz parte da qualidade.', 'Qual atitude melhora a acessibilidade?', ['Usar apenas cores para explicar', 'Adicionar textos alternativos nas imagens', 'Desativar teclado'], 1],
                ['CSS com proposito', 'Estilo comunica e orienta.', 'Com CSS voce cria cores, espacos, grades e adaptacoes para telas pequenas. Consistencia e espaco em branco ajudam o visitante a entender o que e importante.', 'Qual recurso organiza elementos em colunas responsivas?', ['CSS Grid', 'Tamanho fixo em todas as telas', 'Senha do banco'], 0],
                ['Interacao consciente', 'Botões devem responder a acoes reais.', 'JavaScript recebe eventos, altera o conteudo e valida informacoes na interface. Regras importantes devem ser confirmadas tambem no servidor, porque o navegador pode ser alterado.', 'Onde uma regra sensivel deve ser confirmada?', ['So no navegador', 'Somente na cor do botao', 'No servidor'], 2],
                ['Sua primeira ideia', 'Planeje um site util para sua escola.', 'Pense num problema simples, defina quem usara o site e quais tres telas seriam mais importantes. Inclua uma forma de tornar o projeto acessivel e respeitar a privacidade.', 'Descreva o site, quem utilizaria e quais seriam suas tres telas principais.', null, null],
                ['Lançamento e etica', 'Projetos digitais precisam ser testados.', 'Antes de compartilhar um site, teste links, leitura no celular, dados que solicita e acessibilidade. Nao publique nomes e fotos de colegas sem permissao.', 'O que e importante antes de publicar?', ['Testar acessibilidade e proteger dados', 'Solicitar CPF de todos', 'Publicar sem revisar'], 0],
            ],
            'ciberseguranca' => [
                ['O que protegemos', 'Dados pessoais merecem cuidado.', 'Seguranca digital procura preservar confidencialidade, integridade e disponibilidade. Isso significa impedir acessos indevidos, alteracoes nao autorizadas e interrupcoes.', 'Qual principio busca manter sistemas acessiveis quando necessarios?', ['Disponibilidade', 'Animacao', 'Popularidade'], 0],
                ['Golpes e phishing', 'Desconfie de urgencias artificiais.', 'Golpes usam links, promessas e ameacas para obter dados. Verifique o dominio, converse com um responsavel e nunca compartilhe codigos de autenticacao.', 'Ao receber link suspeito, o melhor e...', ['Informar a senha', 'Conferir origem sem abrir o link', 'Encaminhar a todos'], 1],
                ['Senhas e autenticação', 'Uma barreira nao basta.', 'Use senhas longas e diferentes, gerenciador de senhas quando possivel e verificacao em duas etapas. Nao anote senhas em locais publicos.', 'Qual pratica protege melhor a conta?', ['Mesma senha em tudo', 'Senha curta com nome', 'Senha unica e segundo fator'], 2],
                ['Teste etico', 'Permissao vem antes da curiosidade.', 'Seguranca e investigacao com autorizacao. Nunca tente invadir redes, contas ou sistemas da escola. Treine em simuladores autorizados e ambientes de laboratorio.', 'Quando testar a seguranca de um sistema?', ['Somente com autorizacao', 'Quando estiver curioso', 'Sem avisar ninguem'], 0],
                ['Campanha de prevencao', 'Ajude colegas a se protegerem.', 'Crie uma proposta de cartaz ou video ensinando a identificar golpes. Foque em mensagens simples e inclusivas, sem assustar as pessoas.', 'Escreva tres dicas praticas de uma campanha de prevencao a golpes.', null, null],
                ['Privacidade e resposta', 'Se algo acontecer, peça ajuda.', 'Registre o ocorrido de modo responsavel, avise pessoas competentes e altere credenciais comprometidas. Nao publique dados da vitima nem tente retaliar.', 'Qual e a primeira atitude prudente diante de vazamento?', ['Divulgar o vazamento', 'Buscar apoio e proteger a conta', 'Apagar todas as provas'], 1],
            ],
            'dados-ia' => [
                ['Perguntas antes de dados', 'Primeiro defina o que quer descobrir.', 'Analise de dados comeca com uma pergunta objetiva. As informacoes coletadas devem ser suficientes, relevantes e obtidas respeitando a privacidade.', 'Qual e o primeiro passo de uma boa analise?', ['Fazer um grafico aleatorio', 'Definir uma pergunta', 'Coletar todos os dados possiveis'], 1],
                ['Dados limpos', 'Erros mudam conclusoes.', 'Dados duplicados, formatos diferentes e campos faltantes podem distorcer os resultados. Organizar a planilha ajuda a reduzir equívocos.', 'Qual pratica ajuda a evitar contagem duplicada?', ['Revisar valores repetidos', 'Esconder linhas', 'Somar sem olhar'], 0],
                ['Grafico certo', 'Cada visual mostra uma historia.', 'Graficos de barras ajudam a comparar categorias; linhas mostram mudancas no tempo. O grafico deve ter titulos e escalas honestas.', 'Para mostrar evolucao por mes, use preferencialmente...', ['Pizza com 40 fatias', 'Grafico de linhas', 'Imagem sem legenda'], 1],
                ['IA com criterio', 'Modelos podem errar.', 'Inteligencia artificial pode reconhecer padroes, mas tambem reproduzir vieses. Sempre confirme informacoes importantes com fontes confiaveis e evite compartilhar dados sensiveis.', 'Qual atitude responsavel ao usar IA?', ['Confiar em toda resposta', 'Inserir dados privados', 'Conferir fontes e limites'], 2],
                ['Pesquisa da escola', 'Transforme curiosidade em um estudo.', 'Planeje uma pesquisa anonima sobre formas de estudar. Defina pergunta, modo de coletar respostas sem identificacao e que grafico usaria.', 'Descreva uma pesquisa anonima com pergunta, coleta e grafico escolhido.', null, null],
                ['Conclusoes transparentes', 'Diferencie correlacao de causa.', 'Dois fatos acontecerem juntos nao prova que um provocou o outro. Apresente incertezas, tamanho da amostra e limites dos dados.', 'O que significa correlacao?', ['Uma relacao que nao prova causalidade', 'Prova de causa', 'Erro de digitacao'], 0],
            ],
            'design-ux' => [
                ['Design centrado nas pessoas', 'A experiencia começa em quem usa.', 'UX investiga necessidades, dificuldades e objetivos; UI cuida dos elementos com que interagimos. Um produto belo precisa ser facil e inclusivo.', 'Qual e o ponto de partida de UX?', ['Ouvir as pessoas', 'Escolher cores sem contexto', 'Copiar qualquer site'], 0],
                ['Entrevistas simples', 'Pergunte antes de supor.', 'Entrevistas abertas ajudam a entender situacoes reais. Evite perguntas que empurrem o entrevistado para a resposta que voce prefere.', 'Qual pergunta estimula relatos reais?', ['Voce ama este app, ne?', 'O que foi dificil ao usar esse app?', 'Confirma que o design esta perfeito?'], 1],
                ['Rascunhos rapidos', 'Ideias podem nascer no papel.', 'Wireframes sao desenhos simples de telas. Testar um rascunho cedo economiza tempo de desenvolvimento e deixa espaco para melhorias.', 'O que e um wireframe?', ['Desenho estrutural de uma tela', 'Banco de senhas', 'Rede de computadores'], 0],
                ['Acessibilidade visual', 'Design bom inclui mais pessoas.', 'Cores com contraste suficiente, fontes legiveis e areas de toque adequadas ajudam estudantes com diferentes necessidades.', 'Qual melhoria ajuda na leitura?', ['Texto minusculo', 'Contraste adequado', 'Mensagem somente em vermelho'], 1],
                ['Protótipo escolar', 'Desenhe antes de construir.', 'Imagine um aplicativo para localizar eventos da escola. Pense em tres telas, um estudante com pouca internet e no caminho mais curto ate a informacao.', 'Descreva tres telas e uma solucao para acesso com internet limitada.', null, null],
                ['Testes com usuarios', 'A primeira ideia pode melhorar.', 'Peca a colegas para tentar uma tarefa no prototipo. Observe sem dar respostas e anote onde a pessoa encontrou dificuldades.', 'O que fazer num teste de usabilidade?', ['Observar dificuldades sem induzir', 'Dizer onde clicar o tempo todo', 'Ignorar comentarios'], 0],
            ],
            'jogos-digitais' => [
                ['Mecânicas de jogo', 'Regras criam experiencias.', 'Todo jogo tem objetivo, regras e alguma forma de retorno. Antes de criar graficos elaborados, experimente se a acao principal e divertida.', 'O que define uma mecanica?', ['Uma regra de interacao', 'O nome do criador', 'A marca do monitor'], 0],
                ['Desafios progressivos', 'Aprender deve ser possivel.', 'Boas fases introduzem uma habilidade, oferecem pratica e aumentam a complexidade gradualmente. Falhas devem ensinar, nao humilhar.', 'Como organizar a dificuldade?', ['Impossivel desde o inicio', 'Progressiva com feedback', 'Sempre aleatoria'], 1],
                ['Personagens e narrativa', 'Um personagem precisa de motivo.', 'Uma historia simples conecta objetivo, obstaculo e recompensa. Criar personagens originais evita copiar obras de outras pessoas.', 'Qual combinacao fortalece uma historia?', ['Objetivo, obstaculo e decisao', 'Somente um menu', 'Apenas sons altos'], 0],
                ['Logica e eventos', 'Ações geram consequencias.', 'Em muitos jogos, o programa verifica colisões, pontuação e mudanças de cena. Testes pequenos tornam mais facil encontrar falhas.', 'Se um personagem encosta em uma moeda, o jogo pode...', ['Ignorar qualquer regra', 'Executar evento de coleta', 'Desligar o computador'], 1],
                ['Seu minijogo original', 'Idealize uma aventura educativa.', 'Defina o objetivo, como o jogador se move, um obstaculo, tres fases e a mensagem educativa que fica depois da partida.', 'Descreva objetivo, controles, obstaculo e tres fases do seu minijogo.', null, null],
                ['Teste e respeito', 'Jogadores merecem escolhas justas.', 'Evite mecanismos que exploram vulnerabilidades ou estimulam gastos. Teste legibilidade, orientacoes e retorno para quem esta comecando.', 'Qual principio melhora um jogo educativo?', ['Feedback respeitoso e claro', 'Punicao humilhante', 'Regras ocultas'], 0],
            ],
            'infra-cloud' => [
                ['O caminho da internet', 'Computadores conversam em redes.', 'Um dispositivo usa redes para trocar informacoes com outros servicos. Roteadores, enderecos e conexoes permitem que paginas cheguem a voce.', 'Qual equipamento liga redes e encaminha trafego?', ['Roteador', 'Mouse pad', 'Caixa de som'], 0],
                ['Servidor e cliente', 'Servicos respondem a pedidos.', 'Seu navegador pede uma pagina; um servidor recebe a requisicao e devolve uma resposta. Na nuvem, recursos podem ser provisionados conforme necessidade.', 'Quem normalmente solicita uma pagina web?', ['O navegador do usuario', 'A impressora desligada', 'O cabo de energia'], 0],
                ['Disponibilidade', 'Servicos precisam estar funcionando.', 'Monitoramento mostra quando um sistema falha. Redundancia e planos de contingencia podem reduzir interrupcoes.', 'O que ajuda a detectar problemas cedo?', ['Monitoramento', 'Ignorar alertas', 'Apagar registros'], 0],
                ['Backup responsavel', 'Uma copia pode salvar um projeto.', 'Backups precisam ser feitos regularmente, protegidos e testados. Guardar unica copia no mesmo aparelho nao protege contra defeitos.', 'Qual pratica e mais segura?', ['Manter copia separada e testar restauracao', 'Nunca fazer backup', 'Copiar senha em publico'], 0],
                ['Uma escola conectada', 'Planeje um laboratorio disponivel.', 'Desenhe um plano para manter acesso a internet e arquivos de um projeto escolar mesmo quando ocorre uma falha. Inclua um responsavel e uma estrategia de backup.', 'Explique um plano simples de conectividade, monitoramento e backup.', null, null],
                ['Trabalho em equipe', 'Infraestrutura envolve colaboracao.', 'Registrar mudancas, pedir autorizacao e compartilhar aprendizados com a equipe reduz erros. Nunca altere redes da escola sem aval dos responsaveis.', 'Ao precisar mudar a rede escolar, voce deve...', ['Solicitar autorizacao e documentar', 'Alterar escondido', 'Desligar sem avisar'], 0],
            ],
        ];

        foreach ($modules as $slug => $stages) {
            $career = CareerProfile::where('slug', $slug)->firstOrFail();
            $path = LearningPath::updateOrCreate(['slug' => 'trilha-'.$slug], [
                'career_profile_id' => $career->id, 'school_id' => null,
                'title' => 'Jornada de '.$career->name, 'description' => '6 missoes, atividades praticas e projeto final para explorar '.$career->name.'.',
                'estimated_minutes' => 90, 'published' => true,
            ]);
            foreach ($stages as $index => [$title, $description, $lesson, $prompt, $options, $correct]) {
                $path->stages()->updateOrCreate(['position' => $index + 1], [
                    'title' => $title, 'description' => $description, 'lesson' => $lesson,
                    'mission_type' => $options === null ? 'reflection' : 'choice', 'mission_prompt' => $prompt,
                    'options' => $options, 'correct_option' => $correct, 'xp_reward' => $index === 4 ? 100 : 60,
                    'estimated_minutes' => 10 + ($index === 4 ? 15 : 0),
                ]);
            }
        }

        if (app()->environment('local', 'testing')) {
            $school = School::firstOrCreate(['code' => 'ESCOLA-DEMO'], ['name' => 'Escola Demonstracao', 'city' => 'Manaus', 'state' => 'AM', 'active' => true]);
            $class = Classroom::firstOrCreate(['school_id' => $school->id, 'name' => '1º ano A', 'school_year' => '2026']);
            User::firstOrCreate(['email' => 'admin@rotateste.local'], [
                'name' => 'Administrador Demo', 'password' => 'RotaDemo2026!', 'role' => 'admin', 'is_active' => true,
            ]);
            User::firstOrCreate(['email' => 'professor@rotateste.local'], [
                'name' => 'Professor Demo', 'school_id' => $school->id, 'password' => 'RotaDemo2026!', 'role' => 'teacher', 'is_active' => true,
            ]);
            User::firstOrCreate(['email' => 'aluno@rotateste.local'], [
                'name' => 'Alex Exemplo', 'school_id' => $school->id, 'classroom_id' => $class->id,
                'password' => 'RotaDemo2026!', 'role' => 'student', 'is_active' => true,
            ]);
        }
    }
}
