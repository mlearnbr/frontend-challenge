@extends('layout.app')
@section('content')


    <div class="container">
        <div class="row justify-content-center" style="margin-top: 1%;">

            @php
            $count = 0;
            @endphp

            <div class="row">
                @foreach($personagens as $personagem)

                    @if($count === 3)
                    {!! '</div>' !!}
                    {!! '<div class="row">' !!}
                        {{-- {!! '<div class="col-lg-12">' !!} --}}
                    @endif

                    <div class="col-lg-4">
                        <div class="card" style="width: 18rem; margin: 1%;">
                            <div class="card-body">
                                <h5 class="card-title">{{$personagem['name']}}</h5>
                                <p class="card-text">Birth Year: {{$personagem['birth_year']}}</p>
                                <a href="{{route('personagem.get', $personagem['id'])}}" class="btn btn-primary">Details</a>
                            </div>
                        </div>
                    </div>

                    @if($count === 3)
                        @php
                            $count = 0;
                        @endphp

                        {{-- {!! '</div>' !!} --}}
                    @endif

                    @php
                        $count = $count + 1;
                    @endphp

                @endforeach
            </div>

        </div>
    </div>


@endsection
