@extends('layouts.app')
@section('title', 'Entrar')
@section('body_class', 'auth-page')
@section('content')
<section class="auth-wrap"><div class="container auth-grid">
    <div class="auth-story reveal"><span class="kicker">BEM-VINDO DE VOLTA</span><h1>Suas conquistas esperam por <span>voce.</span></h1><p>Continue de onde parou. Seu progresso, suas descobertas e suas novas habilidades estao aqui.</p><div class="auth-decoration"><div class="auth-orb"><svg class="icon"><use href="#i-rocket"/></svg></div><span class="bubble b1">+60 XP</span><span class="bubble b2">NIVEL 04</span><span class="bubble b3">✦ ✦ ✦</span></div></div>
    <div class="auth-panel reveal"><div class="auth-card"><div class="auth-card-icon"><svg class="icon"><use href="#i-lock"/></svg></div><h2>Entrar na minha conta</h2><p>A aventura continua quando voce quiser.</p>
        <form action="{{ route('login.post') }}" method="POST" class="form-stack">@csrf
            <label class="field"><span>E-mail</span><input type="email" name="email" value="{{ old('email') }}" required autocomplete="username" placeholder="seuemail@exemplo.com"></label>
            <label class="field"><span>Senha</span><div class="input-with-icon"><input type="password" id="password" name="password" required autocomplete="current-password" placeholder="Digite sua senha"><button type="button" class="show-password" data-show-password="#password" aria-label="Mostrar senha"><svg class="icon"><use href="#i-eye"/></svg></button></div></label>
            <label class="form-check"><input type="checkbox" name="remember" value="1"><span>Manter conectado neste dispositivo</span></label>
            <button type="submit" class="btn btn-green btn-block btn-large">Entrar no meu mundo <svg class="icon"><use href="#i-arrow"/></svg></button>
        </form><p class="auth-switch">Ainda nao tem conta? <a href="{{ route('register') }}">Cadastre-se gratis</a></p>
    </div></div>
</div></section>
@endsection
