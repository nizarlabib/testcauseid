<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Str; // import library Str
use Illuminate\Http\Client\Request;
use Illuminate\Support\Facades\Request as FacadesRequest;
use Laravel\Lumen\Http\Request as HttpRequest;
use App\Http\Controllers\UserController;
use App\Http\Controllers\RacesController;
use App\Http\Controllers\ActivitiesController;

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

Route::get('/', function () {
    return view('welcome');
});

Route::get('/user/{id}', [UserController::class, 'getUserById']);
Route::get('/user/races/{id}', [RacesController::class, 'getRaceByUserId']);
Route::get('/user/races/progress/{id}', [RacesController::class, 'getProgressRaceByUserId']);
Route::post('/user/races/join', [UserController::class, 'joinRace']);

Route::get('/user/activities/{id}', [ActivitiesController::class, 'getAllActivitiesByUserId']);
Route::post('/user/activities/create', [ActivitiesController::class, 'createActivities']);
Route::post('/user/activities/delete/{id}', [ActivitiesController::class, 'delActivities']);

Route::get('/races/{id}', [RacesController::class, 'getAllRaces']);
Route::get('/races/id/{id}', [RacesController::class, 'getRaceById']);
