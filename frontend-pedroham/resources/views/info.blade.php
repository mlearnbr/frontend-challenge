@extends('layout.app')
@section('content')

@php
    $fimFilms = $personagem['films'];
@endphp
<div class="jumbotron jumbotron-fluid">
    <div class="container">
      <h1 class="display-4">{{$personagem['name']}}</h1>
      <hr class="my-4">
      <p class="lead"><b>Specie:</b> {{$personagem['species']['0']}}</p>
      <hr class="my-4">
      <p class="lead"><b>Films:</b> 
      @foreach($personagem['films'] as $key => $film)
        {{$film}} @if($key !== $fimFilms) / @endif
      @endforeach
      </p>
      <hr class="my-4">
      <p class="lead"><b>Birth Year:</b> {{$personagem['birth_year']}}</p>
      <hr class="my-4">
      <p class="lead"><b>Eye Color:</b> {{$personagem['eye_color']}}</p>
      <hr class="my-4">
      <p class="lead"><b>Gender:</b> {{$personagem['gender']}}</p>
      <hr class="my-4">
      <p class="lead"><b>Hair Color:</b> {{$personagem['hair_color']}}</p>
      <hr class="my-4">
      <p class="lead"><b>Height:</b> {{$personagem['height']}}</p>
      <hr class="my-4">
      <p class="lead"><b>Mass:</b> {{$personagem['mass']}}</p>
      <hr class="my-4">
      <p class="lead"><b>Skin Color:</b> {{$personagem['skin_color']}}</p>
      <hr class="my-4">
      <p class="lead"><b>Homeworld:</b> {{$personagem['homeworld']}}</p>
    </div>
  </div>

{{-- {{dd($personagem)}} --}}

@endsection