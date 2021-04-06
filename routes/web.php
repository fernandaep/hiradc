<?php

use Illuminate\Support\Facades\Route;

Route::view('/{any?}', 'layouts.vue')->where('any','.*');
