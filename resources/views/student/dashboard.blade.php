@extends('layouts.app')
@section('title', 'Meu painel')
@section('content')
<section class="dashboard-hero"><div class="container"><div class="dashboard-top"><div><span class="kicker">SEU ESPACO DE EXPLORACAO</span><h1>Ola, {{ explode(' ', $user->name)[0] }} <span class="wave-hand">✌</span></h1><p>Seu futuro se constrói uma descoberta por vez.</p></div><div class="xp-card"><svg class="icon"><use href="#i-zap"/></svg><div><strong>{{ number_format($user->xp, 0, ',', '.') }} XP</strong><span>pontos de experiencia</span></div></div></div></div></section>
<section class="section dashboard-content"><div class="container">
    <div class="dashboard-overview">
        <div class="welcome-card"><span class="tag tag-green">{{ $attempt ? 'PERFIL DESCOBERTO' : 'CHECKPOINT INICIAL' }}</span>
            @if($attempt)
                <div class="welcome-badge"><svg class="icon"><use href="#i-compass"/></svg></div><h2>Sua maior afinidade atual: <span>{{ $attempt->resultCareer?->name }}</span></h2><p>Isso e apenas um comeco! Conheca tambem as outras areas e descubra novas possibilidades.</p>
                <a class="btn btn-green" href="{{ route('game.result', $attempt) }}">Ver mapa de afinidades <svg class="icon"><use href="#i-arrow"/></svg></a>
            @else
                <div class="welcome-badge"><svg class="icon"><use href="#i-game"/></svg></div><h2>Seu primeiro mundo ja esta <span>desbloqueado.</span></h2><p>Entre no jogo de descobertas, passe pelos desafios e conheca as profissoes que combinam com seus interesses.</p>
                <a class="btn btn-green" href="{{ route('game.play') }}">Iniciar aventura <svg class="icon"><use href="#i-arrow"/></svg></a>
            @endif
        </div>
        <div class="small-stat-grid"><div class="stat-mini"><span class="mini-icon"><svg class="icon"><use href="#i-book"/></svg></span><strong>{{ $enrollments->count() }}</strong><span>Trilhas iniciadas</span></div><div class="stat-mini"><span class="mini-icon"><svg class="icon"><use href="#i-check"/></svg></span><strong>{{ $enrollments->whereNotNull('completed_at')->count() }}</strong><span>Trilhas concluidas</span></div><div class="stat-mini"><span class="mini-icon"><svg class="icon"><use href="#i-trophy"/></svg></span><strong>{{ $certificates->count() }}</strong><span>Certificados</span></div><div class="stat-mini"><span class="mini-icon"><svg class="icon"><use href="#i-stars"/></svg></span><strong>{{ $user->attempts()->where('status','completed')->count() }}</strong><span>Descobertas</span></div></div>
    </div>
    @if($enrollments->isNotEmpty())
    <div class="section-heading short"><span class="kicker">RETOME DE ONDE PAROU</span><h2>Minhas <span>jornadas</span></h2></div>
    <div class="path-cards">@foreach($enrollments as $enrollment)
        @php($total = $enrollment->path->stages->count())
        @php($done = $enrollment->progress->whereNotNull('completed_at')->count())
        <article class="path-card"><div class="path-card-top"><span class="tag">{{ $enrollment->path->career->name }}</span><strong>{{ $total ? round(100*$done/$total) : 0 }}%</strong></div><h3>{{ $enrollment->path->title }}</h3><p>{{ $done }} de {{ $total }} fases concluidas</p><div class="progress-rail"><div style="width: {{ $total ? 100*$done/$total : 0 }}%"></div></div><a href="{{ route('paths.show', $enrollment->path) }}" class="link-arrow">{{ $enrollment->completed_at ? 'Rever trilha' : 'Continuar trilha' }} <svg class="icon"><use href="#i-arrow"/></svg></a></article>
    @endforeach</div>
    @endif
    <div class="section-heading short"><span class="kicker">NOVOS CAMINHOS</span><h2>Trilhas para <span>explorar</span></h2></div>
    <div class="path-cards">@foreach($suggestions as $path)<article class="path-card"><div class="path-card-top"><span class="tag" style="border-color:{{ $path->career->accent }}">{{ $path->career->name }}</span><svg class="icon muted"><use href="#i-book"/></svg></div><h3>{{ $path->title }}</h3><p>{{ $path->description }}</p><div class="meta-row"><span><svg class="icon"><use href="#i-clock"/></svg> {{ $path->estimated_minutes }} min</span><span><svg class="icon"><use href="#i-flag"/></svg> Fases praticas</span></div><a class="link-arrow" href="{{ route('paths.show', $path) }}">Conhecer a trilha <svg class="icon"><use href="#i-arrow"/></svg></a></article>@endforeach</div>
    @if($certificates->isNotEmpty())<div class="section-heading short"><span class="kicker">CONQUISTAS</span><h2>Meus <span>certificados</span></h2></div><div class="certificate-list">@foreach($certificates as $certificate)<a class="certificate-entry" href="{{ route('certificates.show', $certificate) }}"><svg class="icon"><use href="#i-trophy"/></svg><div><strong>{{ $certificate->enrollment->path->title }}</strong><span>Emitido em {{ $certificate->issued_at->format('d/m/Y') }}</span></div><svg class="icon"><use href="#i-arrow"/></svg></a>@endforeach</div>@endif
</div></section>
@endsection
