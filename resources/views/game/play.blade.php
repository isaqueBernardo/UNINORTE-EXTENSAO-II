@extends('layouts.app')
@section('title', 'A aventura das descobertas')
@section('body_class', 'game-page')
@section('content')
<section class="game-section"><div class="container">
    <div class="game-intro"><div><span class="kicker">MUNDO 01 · ILHA DAS POSSIBILIDADES</span><h1>Missao: <span>descobrir seus talentos</span></h1><p>Use <kbd>←</kbd> <kbd>→</kbd> para caminhar e <kbd>Espaço</kbd> ou <kbd>↑</kbd> para pular. Encoste nos portais para enfrentar desafios. Nao existem respostas erradas sobre seus interesses.</p></div><div class="game-hud-right"><span><svg class="icon"><use href="#i-zap"/></svg> +120 XP ao concluir</span><a href="{{ route('dashboard') }}">Sair da fase</a></div></div>
    <div class="game-shell" id="game-shell" data-route-answer="{{ route('game.answer') }}" data-route-start="{{ route('game.start') }}">
        <div class="game-toolbar"><span><i class="live-dot"></i> AVENTURA ATIVA</span><span id="game-progress-label">DESAFIO {{ $state['answered'] + 1 }} / {{ $state['total'] }}</span><span class="game-sound-text">CONTROLES: ← → ↑</span></div>
        <div class="game-canvas-wrap"><canvas id="career-game" width="1120" height="480" tabindex="0" role="img" aria-label="Jogo de plataforma: caminhe ate o portal para responder a uma pergunta. Ha controles de toque abaixo."></canvas><div class="game-toast" id="game-toast" aria-live="polite">Corra ate o portal brilhante!</div></div>
        <div class="game-bottom"><div class="game-progress-track"><div id="game-progress-bar" style="width: {{ $state['total'] ? round(100*$state['answered']/$state['total']) : 0 }}%"></div></div><span><svg class="icon"><use href="#i-flag"/></svg> Sua jornada tem {{ $state['total'] }} checkpoints</span></div>
    </div>
    <div class="touch-controls"><button type="button" data-control="left" aria-label="Mover para esquerda">◀</button><button type="button" data-control="right" aria-label="Mover para direita">▶</button><button type="button" data-control="jump" aria-label="Pular">↑ PULAR</button></div>
    <div class="game-accessible"><button type="button" id="accessible-question" class="btn btn-outline-dark"><svg class="icon"><use href="#i-compass"/></svg> Responder missao sem usar os controles</button><span>Alternativa acessivel para quem prefere responder as perguntas sem atravessar as plataformas.</span></div>
    <div class="game-hint"><svg class="icon"><use href="#i-spark"/></svg> Dica: seus interesses podem mudar. O objetivo e conhecer possibilidades, nao receber um rotulo definitivo.</div>
</div></section>
<div class="mission-modal" id="mission-modal" role="dialog" aria-modal="true" aria-labelledby="mission-title" hidden><div class="mission-backdrop"></div><div class="mission-card"><div class="mission-card-top"><span class="tag tag-green" id="mission-count">PORTAL 01</span><div class="mission-stars">✦ ✦ ✦</div></div><div class="mission-icon"><svg class="icon"><use href="#i-compass"/></svg></div><h2 id="mission-title">Uma nova missao!</h2><p id="mission-scenario"></p><div class="mission-options" id="mission-options"></div><p class="mission-error" id="mission-error" role="alert" hidden></p><span class="mission-note">Escolha o caminho que voce teria vontade de experimentar.</span></div></div>
<div class="transition-curtain" id="transition-curtain" hidden><div class="curtain-half curtain-left"></div><div class="curtain-half curtain-right"></div><div class="curtain-center"><svg class="icon"><use href="#i-trophy"/></svg><strong>VOCÊ DESBLOQUEOU UM NOVO CAMINHO!</strong><span>Preparando seu mapa de trilhas...</span></div></div>
@endsection
@push('scripts')<script>window.ROTA_GAME = @json($state);</script><script src="{{ asset('assets/js/game.js') }}" defer></script>@endpush
