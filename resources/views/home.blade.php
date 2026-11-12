@extends('layouts.app')
@section('title', 'Seu futuro comeca aqui')
@section('body_class', 'page-home')
@section('content')
<section class="hero-section">
    <div class="hero-gridlines"></div>
    <div class="container hero-grid">
        <div class="hero-copy reveal">
            <div class="eyebrow"><span class="pulse-dot"></span> UMA NOVA FORMA DE EXPLORAR A TECNOLOGIA</div>
            <h1>Seu futuro nao vem com <em>manual.</em><br><span>Vem com fases.</span></h1>
            <p>Descubra suas afinidades em um jogo de aventura, desbloqueie trilhas de aprendizagem e transforme curiosidade em projetos reais. Tudo no seu ritmo.</p>
            <div class="hero-actions">
                <a class="btn btn-green btn-large" href="{{ auth()->check() ? route('dashboard') : route('register') }}">{{ auth()->check() ? 'Continuar aventura' : 'Comecar minha jornada' }} <svg class="icon"><use href="#i-arrow"/></svg></a>
                <a class="btn btn-outline-light btn-large" href="#como-funciona"><svg class="icon"><use href="#i-game"/></svg> Como funciona?</a>
            </div>
            <div class="hero-proof"><span class="avatar-stack"><b>W</b><b>UX</b><b>AI</b></span><span><strong>6 mundos para explorar</strong><small>Sem precisar saber programar</small></span></div>
        </div>
        <div class="hero-preview reveal" aria-label="Ilustracao de uma jornada gamificada">
            <div class="orbit orbit-one"></div><div class="orbit orbit-two"></div>
            <div class="floating-chip chip-top"><svg class="icon"><use href="#i-zap"/></svg> +120 XP</div>
            <div class="game-display">
                <div class="game-display-top"><span><i class="live-dot"></i> MUNDO 01 / DESCOBERTA</span><span class="game-top-pill">LVL 01</span></div>
                <div class="pixel-sky"><span class="px-cloud pc1"></span><span class="px-cloud pc2"></span><span class="px-star ps1">✦</span><span class="px-star ps2">✦</span>
                    <div class="pixel-coins"><span>✦</span><span>✦</span><span>✦</span></div>
                    <div class="pixel-character"><span class="character-head"><i></i><i></i></span><span class="character-body"></span><span class="character-feet"></span></div>
                    <div class="pixel-portal"><span>?</span></div>
                    <div class="pixel-ground"></div>
                </div>
                <div class="game-display-bottom"><span>MISSÃO 01/12</span><div class="mock-bar"><i></i></div><span>02:35</span></div>
            </div>
            <div class="floating-chip chip-bottom"><svg class="icon"><use href="#i-trophy"/></svg> Certificado desbloqueavel</div>
            <div class="hero-deco deco-a">+</div><div class="hero-deco deco-b">✳</div>
        </div>
    </div>
    <div class="hero-wave"></div>
</section>
<section id="como-funciona" class="section section-how"><div class="container">
    <div class="section-heading center reveal"><span class="kicker">SUA AVENTURA EM 3 PASSOS</span><h2>Jogue. Descubra. <span>Construa.</span></h2><p>A tecnologia tem varias portas. Voce nao precisa escolher uma para sempre: comece explorando.</p></div>
    <div class="how-grid">
        <article class="how-card reveal"><span class="step-number">01</span><div class="feature-icon green"><svg class="icon"><use href="#i-game"/></svg></div><h3>Explore o jogo</h3><p>Corra, salte e enfrente situacoes do dia a dia. Suas escolhas revelam diferentes afinidades com areas de TI.</p><span class="card-foot">12 missoes interativas <svg class="icon"><use href="#i-arrow"/></svg></span></article>
        <article class="how-card reveal"><span class="step-number">02</span><div class="feature-icon blue"><svg class="icon"><use href="#i-compass"/></svg></div><h3>Encontre suas afinidades</h3><p>Receba um mapa com suas areas mais proximas e descubra como e a rotina de diferentes profissoes.</p><span class="card-foot">6 caminhos possiveis <svg class="icon"><use href="#i-arrow"/></svg></span></article>
        <article class="how-card reveal"><span class="step-number">03</span><div class="feature-icon purple"><svg class="icon"><use href="#i-trophy"/></svg></div><h3>Desbloqueie trilhas</h3><p>Avance por fases, experimente desafios, crie um projeto para a escola e conquiste um certificado.</p><span class="card-foot">Aprenda no seu ritmo <svg class="icon"><use href="#i-arrow"/></svg></span></article>
    </div>
</div></section>
<section class="section careers-section"><div class="container">
    <div class="section-heading reveal"><span class="kicker">MUNDOS PARA DESCOBRIR</span><h2>Qual universo combina <span>com voce?</span></h2><p>O seu resultado e um ponto de partida, nao uma etiqueta. Explore quantas areas quiser.</p></div>
    <div class="career-grid">
        @foreach($careers as $career)
        <div class="career-card reveal" style="--accent: {{ $career->accent }}"><div class="career-card-top"><span class="career-symbol">@switch($career->slug)@case('desenvolvimento-web')&lt;/&gt;@break @case('ciberseguranca')◈@break @case('dados-ia')▥@break @case('design-ux')✳@break @case('jogos-digitais')✦@break @default ☁ @endswitch</span><svg class="icon"><use href="#i-arrow"/></svg></div><h3>{{ $career->name }}</h3><p>{{ $career->description }}</p><span class="career-label">{{ $career->paths_count }} trilha(s) disponivel(is)</span></div>
        @endforeach
    </div>
</div></section>
<section class="cta-section"><div class="container"><div class="cta-card reveal"><div><span class="kicker">PRONTO PARA O PRIMEIRO NIVEL?</span><h2>Todo grande projeto comeca com <span>um primeiro passo.</span></h2><p>O seu proximo desafio pode ser a descoberta de algo que voce nem imaginava gostar.</p></div><a class="btn btn-green btn-large" href="{{ auth()->check() ? route('dashboard') : route('register') }}">Bora explorar <svg class="icon"><use href="#i-rocket"/></svg></a></div></div></section>
@endsection
