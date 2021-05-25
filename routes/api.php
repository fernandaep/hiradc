<?php
use App\Http\Controllers\KaryawanController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ActivityController;
use App\Http\Controllers\PossibilityController;
use App\Http\Controllers\ConditionController;
use App\Http\Controllers\ThreatController;
use App\Http\Controllers\VulnerabilityController;
use App\Http\Controllers\TermController;
use App\Http\Controllers\ConsequencesController;
use App\Http\Controllers\K3teamController;
use App\Http\Controllers\RegisterController;

Route::resource('karyawan', KaryawanController::class);
Route::resource('category', CategoryController::class);
Route::resource('activity', ActivityController::class);
Route::resource('possibility', PossibilityController::class);
Route::resource('condition', ConditionController::class);
Route::resource('threat', ThreatController::class);
Route::resource('vulnerability', VulnerabilityController::class);
Route::resource('term', TermController::class);
Route::resource('consequence', ConsequencesController::class);
Route::resource('k3team', K3teamController::class);
Route::resource('register', RegisterController::class);
Route::get('k3team/koordinator','App\Http\Controllers\K3teamController@koordinator')->name('k3team.koordinator');

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

