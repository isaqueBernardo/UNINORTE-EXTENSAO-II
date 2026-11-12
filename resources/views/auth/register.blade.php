@extends('layouts.app')
@section('title', 'Criar conta')
@section('body_class', 'auth-page')
@section('content')
<section class="auth-wrap"><div class="container auth-grid">
    <div class="auth-story reveal"><span class="kicker">SEU PRIMEIRO CHECKPOINT</span><h1>Crie seu avatar. <span>Abra novas portas.</span></h1><p>Seu cadastro e rapido. Depois dele, a aventura comeca com o desafio vocacional!</p><div class="signup-perks"><div><svg class="icon"><use href="#i-check"/></svg> Sem conhecimento previo de TI</div><div><svg class="icon"><use href="#i-check"/></svg> Experiencia com missões e recompensas</div><div><svg class="icon"><use href="#i-check"/></svg> Trilhas e certificado de participacao</div></div></div>
    <div class="auth-panel reveal"><div class="auth-card auth-register"><div class="auth-card-icon"><svg class="icon"><use href="#i-rocket"/></svg></div><h2>Comecar minha jornada</h2><p>Informe seus dados para entrar na aventura.</p>
        <form action="{{ route('register.post') }}" method="POST" class="form-stack" data-register-form>@csrf
            <label class="field"><span>Como podemos chamar voce?</span><input name="name" required minlength="3" maxlength="120" value="{{ old('name') }}" placeholder="Seu nome"></label>
            <label class="field"><span>E-mail</span><input type="email" name="email" required value="{{ old('email') }}" placeholder="voce@exemplo.com"></label>
            <label class="field"><span>Codigo da sua escola <small>(peca ao professor)</small></span><input name="school_code" id="school-code" required value="{{ old('school_code') }}" placeholder="Ex.: ESCOLA-DEMO" autocapitalize="characters"><small class="field-hint" id="school-status" role="status">O codigo identifica sua escola com seguranca.</small></label>
            <label class="field"><span>Turma <small>(opcional)</small></span><select name="classroom_id" id="classroom-select"><option value="">Primeiro informe o codigo escolar</option></select></label>
            <label class="field"><span>Crie uma senha</span><div class="input-with-icon"><input type="password" name="password" id="reg-password" minlength="10" required placeholder="Pelo menos 10 caracteres"><button type="button" class="show-password" data-show-password="#reg-password" aria-label="Mostrar senha"><svg class="icon"><use href="#i-eye"/></svg></button></div><div class="password-meter"><i data-password-meter></i></div></label>
            <label class="field"><span>Confirme a senha</span><input type="password" name="password_confirmation" minlength="10" required placeholder="Digite novamente"></label>
            <label class="form-check"><input type="checkbox" name="privacy_ack" value="1" required><span>Entendo que minhas respostas serao usadas para orientar trilhas e acompanhar a aprendizagem pela escola. O resultado nao e um teste psicologico ou diagnostico de profissao.</span></label>
            <button type="submit" class="btn btn-green btn-large btn-block">Criar conta e jogar <svg class="icon"><use href="#i-arrow"/></svg></button>
        </form><p class="auth-switch">Ja tem conta? <a href="{{ route('login') }}">Fazer login</a></p>
    </div></div>
</div></section>
@endsection
