<?php
use Illuminate\Support\Facades\Artisan;

Artisan::command('rota:sobre', function () {
    $this->info('Rota Tech: explore, aprenda e construa seu caminho.');
});
