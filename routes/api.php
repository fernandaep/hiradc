<?php
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

use App\Http\Controllers\AuthController;
use App\Http\Controllers\TermController;
use App\Http\Controllers\UnitController;
use App\Http\Controllers\AssetController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\K3teamController;
use App\Http\Controllers\ThreatController;
use App\Http\Controllers\ActivityController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\KaryawanController;
use App\Http\Controllers\MitigasiController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\ConditionController;
use App\Http\Controllers\PossibilityController;
use App\Http\Controllers\ConsequencesController;
use App\Http\Controllers\VulnerabilityController;

Route::resource('karyawan', KaryawanController::class);
Route::resource('category', CategoryController::class);
Route::resource('activity', ActivityController::class);
Route::resource('asset', AssetController::class);
Route::resource('possibility', PossibilityController::class);
Route::resource('mitigasi', MitigasiController::class);
Route::resource('unit', UnitController::class);
Route::resource('condition', ConditionController::class);
Route::resource('threat', ThreatController::class);
Route::resource('vulnerability', VulnerabilityController::class);
Route::resource('term', TermController::class);
Route::resource('consequence', ConsequencesController::class);
Route::resource('k3team', K3teamController::class);
Route::resource('register', RegisterController::class);

Route::get('condition/{id}/showkat',[conditionController::class,'showkat'])->name('condition.showkat');
Route::get('threat/{id}/threatkat',[ThreatController::class,'threatkat'])->name('threat.threatkat');
Route::get('vulnerability/{id}/showkat',[VulnerabilityController::class,'showkat'])->name('vulnerability.showkat');
Route::get('consequence/{id}/showkat',[ConsequencesController::class,'showkat'])->name('consequence.showkat');
Route::get('karyawan/{id}/getkoor',[KaryawanController::class,'getkoor'])->name('karyawan.getkoor');
Route::get('karyawan/getunit',[KaryawanController::class,'getunit'])->name('karyawan.getunit');
Route::get('karyawan/{id}/getketua',[KaryawanController::class,'getketua'])->name('karyawan.getketua');
Route::get('karyawan/{id}/getpic',[KaryawanController::class,'getpic'])->name('karyawan.getpic');
Route::put('register/{id}/approved',[RegisterController::class,'approved'])->name('register.approved');
Route::put('register/{id}/verified',[RegisterController::class,'verified'])->name('register.verified');
Route::get('register/{tglawal}/{tglakhir}/export',[RegisterController::class,'export'])->name('register.export');
Route::get('register/{id}/exportunit',[RegisterController::class,'exportunit'])->name('register.exportunit');
Route::get('mitigasi/{tglawal}/{tglakhir}/exportmitigasi',[MitigasiController::class,'exportmitigasi'])->name('mitigasi.exportmitigasi');
Route::post('k3team/adminlogin',[K3teamController::class,'adminlogin'])->name('k3team.adminlogin');


Route::post('/login', [LoginController::class,'index'])->name('login');
Route::get('/logout', [LoginController::class,'logout'])->name('logout');
Route::post('/registrasi', [AuthController::class,'store'])->name('registrasi');

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
 });
 

