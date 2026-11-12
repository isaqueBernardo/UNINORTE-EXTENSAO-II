@extends('layouts.app')
@section('title', $stage->title)
@section('content')
<section class="simple-hero lesson-hero"><div class="container"><a href="{{ route('paths.show', $path) }}" class="back-link">← Voltar ao mapa</a><span class="kicker">{{ $path->career->name }} · FASE {{ $stage->position }}</span><h1>{{ $stage->title }}</h1><p>{{ $stage->description }}</p><div class="meta-row meta-light"><span><svg class="icon"><use href="#i-zap"/></svg> +{{ $stage->xp_reward }} XP</span><span><svg class="icon"><use href="#i-clock"/></svg> {{ $stage->estimated_minutes }} min</span></div></div></section>
<section class="section"><div class="container lesson-grid"><article class="lesson-content"><span class="tag tag-green">CADERNO DE EXPLORACAO</span><h2>Hora de aprender</h2><div class="lesson-body">{!! nl2br(e($stage->lesson)) !!}</div><div class="lesson-tip"><svg class="icon"><use href="#i-spark"/></svg><div><strong>Curiosidade de explorador</strong><p>Voce nao precisa acertar tudo de primeira. Testar, rever e tentar de novo tambem faz parte de aprender tecnologia.</p></div></div></article><aside class="mission-sidebar"><span class="kicker">DESAFIO DA FASE {{ $stage->position }}</span><h2>{{ $alreadyDone ? 'Missao concluida!' : 'Sua missao' }}</h2><p>{{ $stage->mission_prompt }}</p>
@if($alreadyDone)<div class="mission-done"><svg class="icon"><use href="#i-check"/></svg><strong>Voce ja concluiu essa missao.</strong><span>+{{ $stage->xp_reward }} XP conquistados</span></div><a href="{{ route('paths.show', $path) }}" class="btn btn-green btn-block">Voltar ao mapa <svg class="icon"><use href="#i-arrow"/></svg></a>
@else
<form action="{{ route('paths.complete', [$path, $stage]) }}" method="POST" class="challenge-form">@csrf
    @if($stage->mission_type === 'choice')
        <div class="choice-stack">@foreach(($stage->options ?? []) as $option)<label class="challenge-choice"><input type="radio" name="answer" value="{{ $loop->index }}" required {{ old('answer') === (string)$loop->index ? 'checked' : '' }}><span class="answer-letter">{{ chr(65+$loop->index) }}</span><span>{{ $option }}</span></label>@endforeach</div>
    @else
        <label class="field"><span>Sua ideia / projeto</span><textarea name="answer" minlength="25" maxlength="4000" required rows="8" placeholder="Escreva como voce resolveria essa missao usando tecnologia...">{{ old('answer') }}</textarea></label><p class="field-hint">Este espaco e para experimentar ideias. Evite incluir dados pessoais de outras pessoas.</p>
    @endif
    <button class="btn btn-green btn-large btn-block" type="submit">Concluir missao <svg class="icon"><use href="#i-check"/></svg></button>
</form>@endif</aside></div></section>
@endsection
