<?php
return [
    'name' => env('APP_NAME', 'Rota Tech'),
    'env' => env('APP_ENV', 'production'),
    'debug' => (bool) env('APP_DEBUG', false),
    'url' => env('APP_URL', 'http://localhost'),
    'timezone' => env('APP_TIMEZONE', 'America/Manaus'),
    'locale' => env('APP_LOCALE', 'pt_BR'),
    'fallback_locale' => env('APP_FALLBACK_LOCALE', 'pt_BR'),
    'faker_locale' => env('APP_FAKER_LOCALE', 'pt_BR'),
    'key' => env('APP_KEY'),
    'cipher' => 'AES-256-CBC',
    'previous_keys' => array_filter(explode(',', env('APP_PREVIOUS_KEYS', ''))),
];
