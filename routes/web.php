<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CetakRegisterController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
//Route::get('cetakregister', 'CetakRegisterController@index')->name('cetakregister');
//Route::get('cetakregisterpertanggal', 'CetakRegisterController@exportPDF')->name('cetakregisterpertanggal');
Route::view('/{any?}', 'layouts.vue')->where('any','.*');
