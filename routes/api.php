<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ActivityController;
use App\Http\Controllers\PossibilityController;
use App\Http\Controllers\ConditionController;
use App\Http\Controllers\ThreatController;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::resource('category', CategoryController::class);
Route::resource('activity', ActivityController::class);
Route::resource('possibility', PossibilityController::class);
Route::resource('condition', ConditionController::class);
Route::resource('threat', ThreatController::class);

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

