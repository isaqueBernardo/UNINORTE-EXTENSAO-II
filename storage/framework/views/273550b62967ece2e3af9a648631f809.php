<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#162c51"><meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
    <meta name="description" content="Rota Tech: descubra carreiras de tecnologia, jogue missoes, evolua em trilhas e conquiste certificados.">
    <title><?php echo $__env->yieldContent('title', 'Rota Tech'); ?> · Explore seu futuro</title>
    <link rel="stylesheet" href="<?php echo e(asset('assets/css/app.css')); ?>">
    <?php echo $__env->yieldPushContent('head'); ?>
</head>
<body class="<?php echo $__env->yieldContent('body_class'); ?>">
<?php echo $__env->make('partials.icons', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
<div class="site-shell">
    <header class="site-header">
        <div class="container nav-wrap">
            <a href="<?php echo e(route('home')); ?>" class="brand" aria-label="Rota Tech, inicio">
                <span class="brand-logo"><svg class="icon"><use href="#i-rocket"/></svg></span>
                <span>ROTA<span class="brand-green">TECH</span><small>descubra seu proximo nivel</small></span>
            </a>
            <button type="button" class="nav-toggle" aria-label="Abrir menu" aria-expanded="false" data-menu-toggle><svg class="icon"><use href="#i-menu"/></svg></button>
            <nav class="nav-links" id="main-menu" aria-label="Menu principal">
                <a href="<?php echo e(route('home')); ?>">Inicio</a>
                <?php if(auth()->guard()->check()): ?>
                    <a href="<?php echo e(route('dashboard')); ?>">Meu painel</a>
                    <a href="<?php echo e(route('careers.index')); ?>">Carreiras</a>
                    <?php if(auth()->user()->role === 'student'): ?><a href="<?php echo e(route('game.play')); ?>">Aventura</a><?php else: ?><a href="<?php echo e(route('staff.manage')); ?>">Gestao</a><?php endif; ?>
                    <form method="POST" action="<?php echo e(route('logout')); ?>"><?php echo csrf_field(); ?> <button class="nav-logout" type="submit"><svg class="icon"><use href="#i-log-out"/></svg> Sair</button></form>
                <?php else: ?>
                    <a href="<?php echo e(route('login')); ?>">Entrar</a>
                    <a class="btn btn-small btn-green" href="<?php echo e(route('register')); ?>">Comecar agora <svg class="icon"><use href="#i-arrow"/></svg></a>
                <?php endif; ?>
            </nav>
        </div>
    </header>
    <main id="main-content">
        <?php if(session('success')): ?><div class="container"><div class="flash flash-success" role="status"><svg class="icon"><use href="#i-check"/></svg><?php echo e(session('success')); ?></div></div><?php endif; ?>
        <?php if($errors->any()): ?><div class="container"><div class="flash flash-error" role="alert"><strong>Confira os campos:</strong> <?php echo e($errors->first()); ?></div></div><?php endif; ?>
        <?php echo $__env->yieldContent('content'); ?>
    </main>
    <footer class="site-footer">
        <div class="container footer-flex"><div class="footer-brand"><strong>ROTA<span>TECH</span></strong><small>Carreira nao e destino fixo. E uma jornada de descoberta.</small></div><span>Feito para aprender, criar e crescer. · <?php echo e(date('Y')); ?></span></div>
    </footer>
</div>
<script defer src="<?php echo e(asset('assets/js/app.js')); ?>"></script>
<?php echo $__env->yieldPushContent('scripts'); ?>
</body>
</html>
<?php /**PATH C:\wamp64\www\rota_tech_laravel\resources\views/layouts/app.blade.php ENDPATH**/ ?>