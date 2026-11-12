<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#162c51"><meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="description" content="Rota Tech: descubra carreiras de tecnologia, jogue missoes, evolua em trilhas e conquiste certificados.">
    <title>@yield('title', 'Rota Tech') · Explore seu futuro</title>
    <link rel="stylesheet" href="{{ asset('assets/css/app.css') }}">
    @stack('head')
</head>
<body class="@yield('body_class')">
@include('partials.icons')
<div class="site-shell">
    <header class="site-header">
        <div class="container nav-wrap">
            <a href="{{ route('home') }}" class="brand" aria-label="Rota Tech, inicio">
                <span class="brand-logo"><svg class="icon"><use href="#i-rocket"/></svg></span>
                <span>ROTA<span class="brand-green">TECH</span><small>descubra seu proximo nivel</small></span>
            </a>
            <button type="button" class="nav-toggle" aria-label="Abrir menu" aria-expanded="false" data-menu-toggle><svg class="icon"><use href="#i-menu"/></svg></button>
            <nav class="nav-links" id="main-menu" aria-label="Menu principal">
                <a href="{{ route('home') }}">Inicio</a>
                @auth
                    <a href="{{ route('dashboard') }}">Meu painel</a>
                    <a href="{{ route('careers.index') }}">Carreiras</a>
                    @if(auth()->user()->role === 'student')<a href="{{ route('game.play') }}">Aventura</a>@else<a href="{{ route('staff.manage') }}">Gestao</a>@endif
                    <form method="POST" action="{{ route('logout') }}">@csrf <button class="nav-logout" type="submit"><svg class="icon"><use href="#i-log-out"/></svg> Sair</button></form>
                @else
                    <a href="{{ route('login') }}">Entrar</a>
                    <a class="btn btn-small btn-green" href="{{ route('register') }}">Comecar agora <svg class="icon"><use href="#i-arrow"/></svg></a>
                @endauth
            </nav>
        </div>
    </header>
    <main id="main-content">
        @if(session('success'))<div class="container"><div class="flash flash-success" role="status"><svg class="icon"><use href="#i-check"/></svg>{{ session('success') }}</div></div>@endif
        @if($errors->any())<div class="container"><div class="flash flash-error" role="alert"><strong>Confira os campos:</strong> {{ $errors->first() }}</div></div>@endif
        @yield('content')
    </main>
    <footer class="site-footer">
        <div class="container footer-flex"><div class="footer-brand"><strong>ROTA<span>TECH</span></strong><small>Carreira nao e destino fixo. E uma jornada de descoberta.</small></div><span>Feito para aprender, criar e crescer. · {{ date('Y') }}</span></div>
    </footer>
</div>
<script defer src="{{ asset('assets/js/app.js') }}"></script>
@stack('scripts')
</body>
</html>
