import 'package:flutter_application/features/character_details/infrastructure/models/film_model.dart';
import 'package:flutter_application/features/character_list/domain/entities/character_entity.dart';
import 'package:flutter_application/features/character_list/infrastructure/models/specie_model.dart';

const characterEntityMock = CharacterEntity(
  name: 'name',
  birthYear: 'birthYear',
  eyeColor: 'eyeColor',
  gender: 'gender',
  hairColor: 'hairColor',
  height: 'height',
  mass: 'mass',
  skinColor: 'skinColor',
  homeworld: 'homeworld',
  films: [],
  species: [],
);

const specieMock = SpecieModel(
  name: 'name',
  classification: 'classification',
  designation: 'designation',
  averageHeight: 'averageHeight',
  skinColors: 'skinColors',
  hairColors: 'hairColors',
  eyeColors: 'eyeColors',
  averageLifespan: 'averageLifespan',
  language: 'language',
  people: [],
  films: [],
);

const filmMock = FilmModel(title: 'title');

const filmListMock = [
  filmMock,
  filmMock,
  filmMock,
  filmMock,
];

const characterListMock = [
  characterEntityMock,
  characterEntityMock,
  characterEntityMock,
  characterEntityMock
];

const characterListJson = '''
{
    "count": 82, 
    "next": "https://swapi.dev/api/people/?page=2", 
    "previous": null, 
    "results": [
        {
            "name": "Luke Skywalker", 
            "height": "172", 
            "mass": "77", 
            "hair_color": "blond", 
            "skin_color": "fair", 
            "eye_color": "blue", 
            "birth_year": "19BBY", 
            "gender": "male", 
            "homeworld": "https://swapi.dev/api/planets/1/", 
            "films": [
                "https://swapi.dev/api/films/1/", 
                "https://swapi.dev/api/films/2/", 
                "https://swapi.dev/api/films/3/", 
                "https://swapi.dev/api/films/6/"
            ], 
            "species": [], 
            "vehicles": [
                "https://swapi.dev/api/vehicles/14/", 
                "https://swapi.dev/api/vehicles/30/"
            ], 
            "starships": [
                "https://swapi.dev/api/starships/12/", 
                "https://swapi.dev/api/starships/22/"
            ], 
            "created": "2014-12-09T13:50:51.644000Z", 
            "edited": "2014-12-20T21:17:56.891000Z", 
            "url": "https://swapi.dev/api/people/1/"
        }, 
        {
            "name": "Luke Skywalker", 
            "height": "172", 
            "mass": "77", 
            "hair_color": "blond", 
            "skin_color": "fair", 
            "eye_color": "blue", 
            "birth_year": "19BBY", 
            "gender": "male", 
            "homeworld": "https://swapi.dev/api/planets/1/", 
            "films": [
                "https://swapi.dev/api/films/1/", 
                "https://swapi.dev/api/films/2/", 
                "https://swapi.dev/api/films/3/", 
                "https://swapi.dev/api/films/6/"
            ], 
            "species": [], 
            "vehicles": [
                "https://swapi.dev/api/vehicles/14/", 
                "https://swapi.dev/api/vehicles/30/"
            ], 
            "starships": [
                "https://swapi.dev/api/starships/12/", 
                "https://swapi.dev/api/starships/22/"
            ], 
            "created": "2014-12-09T13:50:51.644000Z", 
            "edited": "2014-12-20T21:17:56.891000Z", 
            "url": "https://swapi.dev/api/people/1/"
        } 
      ]
  }
''';

const characterSpecie = '''
{
	"name": "Droid",
	"classification": "artificial",
	"designation": "sentient",
	"average_height": "n/a",
	"skin_colors": "n/a",
	"hair_colors": "n/a",
	"eye_colors": "n/a",
	"average_lifespan": "indefinite",
	"homeworld": null,
	"language": "n/a",
	"people": [
		"https://swapi.dev/api/people/2/",
		"https://swapi.dev/api/people/3/",
		"https://swapi.dev/api/people/8/",
		"https://swapi.dev/api/people/23/"
	],
	"films": [
		"https://swapi.dev/api/films/1/",
		"https://swapi.dev/api/films/2/",
		"https://swapi.dev/api/films/3/",
		"https://swapi.dev/api/films/4/",
		"https://swapi.dev/api/films/5/",
		"https://swapi.dev/api/films/6/"
	],
	"created": "2014-12-10T15:16:16.259000Z",
	"edited": "2014-12-20T21:36:42.139000Z",
	"url": "https://swapi.dev/api/species/2/"
}
''';
