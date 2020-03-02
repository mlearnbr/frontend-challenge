<?php

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
use GuzzleHttp\Client;

Route::get('/', function () {    
    $personagens = array();
    $url = "https://swapi.co/api/people/";

    $client = new Client();
    while($url != null){
        $response = $client->request('GET', $url);
        $statusCode = $response->getStatusCode();
        $body = $response->getBody()->getContents();

        $resultado = json_decode($body, true);

        $url = $resultado['next'];
        
        foreach($resultado['results'] as $keyChar => $charac){
            $charac['id'] = str_replace('/', '', substr($charac['url'], -2));
            array_push($personagens, $charac);
        }
        
    }
    collect($personagens);

    return view('welcome', compact('personagens'));
})->name('home');

Route::get('/personagem/{id}', function($id){

    $client = new Client();
    $response = $client->request('GET', "https://swapi.co/api/people/".$id);
    $statusCode = $response->getStatusCode();
    $body = $response->getBody()->getContents();

    $personagem = collect(json_decode($body, true));

    $films   = [];  
    $species = [];  
    $homeworld = '';

    foreach($personagem['films'] as $key => $film){

        $response2 = $client->request('GET', $film);
        $statusCode2 = $response2->getStatusCode();
        $body2 = $response2->getBody()->getContents();

        $filmAtual = collect(json_decode($body2, true));

        array_push($films, $filmAtual['title']);
    }

    foreach($personagem['species'] as $specie){
        $response3 = $client->request('GET', $specie);
        $statusCode3 = $response3->getStatusCode();
        $body3 = $response3->getBody()->getContents();

        $specieAtual = collect(json_decode($body3, true));

        array_push($species, $specieAtual['name']);
    }

    {//homeworld
        $response4 = $client->request('GET', $personagem['homeworld']);
        $statusCode4 = $response4->getStatusCode();
        $body4 = $response4->getBody()->getContents();

        $planetAtual = collect(json_decode($body4, true));

        $homewold = $planetAtual['name'];
    }

    $personagem['films']   = $films;
    $personagem['species'] = $species;
    $personagem['homeworld'] = $homewold;

    return view('info', compact('personagem'));

})->name('personagem.get');
