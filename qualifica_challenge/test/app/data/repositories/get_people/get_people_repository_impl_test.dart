import 'package:flutter_test/flutter_test.dart';
import 'package:qualifica_challenge/app/data/models/people_model.dart';
import 'package:qualifica_challenge/app/data/repositories/get_people/get_people_repository.dart';

var people = PeopleModel(
  name: 'Luke Skywalker',
  height: '172',
  mass: '77',
  hairColor: 'blond',
  skinColor: 'fair',
  eyeColor: 'blue',
  birthYear: '19BBY',
  gender: 'male',
  homeworld: 'https://swapi.dev/api/planets/1/',
  films: [
    'https://swapi.dev/api/films/1/',
    'https://swapi.dev/api/films/2/',
    'https://swapi.dev/api/films/3/',
    'https://swapi.dev/api/films/6/'
  ],
  species: [],
);

List<PeopleModel> listPeople = [
  PeopleModel(
    name: 'Luke Skywalker',
    height: '172',
    mass: '77',
    hairColor: 'blond',
    skinColor: 'fair',
    eyeColor: 'blue',
    birthYear: '19BBY',
    gender: 'male',
    homeworld: 'https://swapi.dev/api/planets/1/',
    films: [
      'https://swapi.dev/api/films/1/',
      'https://swapi.dev/api/films/2/',
      'https://swapi.dev/api/films/3/',
      'https://swapi.dev/api/films/6/'
    ],
    species: [],
  ),
  PeopleModel(
    name: 'C-3PO',
    height: '167',
    mass: '75',
    hairColor: 'n/a',
    skinColor: 'gold',
    eyeColor: 'yellow',
    birthYear: '112BBY',
    gender: 'n/a',
    homeworld: 'https://swapi.dev/api/planets/1/',
    films: [
      'https://swapi.dev/api/films/1/',
      'https://swapi.dev/api/films/2/',
      'https://swapi.dev/api/films/3/',
      'https://swapi.dev/api/films/4/',
      'https://swapi.dev/api/films/5/',
      'https://swapi.dev/api/films/6/'
    ],
    species: ["https://swapi.dev/api/species/2/"],
  ),
];

class GetPeopleRepositoryImpl implements GetPeopleRepository {
  @override
  Future<List<PeopleModel>> getPeopleRepository() async {
    return listPeople;
  }

  @override
  Future<List<PeopleModel>> getPeopleNextIdRepository(int nextId) async {
    return listPeople;
  }

  @override
  Future<PeopleModel> getPeopleCatalogRepository(String url) async {
    return people;
  }
}

main() {
  GetPeopleRepository repository = GetPeopleRepositoryImpl();

  test("O teste deve retornar uma lista de people no repository.", () async {
    final result = await repository.getPeopleRepository();

    expect(result, isA<List<PeopleModel>>());
  });

  test("O teste deve retornar uma lista de people na próxima página.",
      () async {
    final result = await repository.getPeopleNextIdRepository(0);

    expect(result, isA<List<PeopleModel>>());
  });

  test("O teste deve retornar um model de people no repository.", () async {
    final result = await repository.getPeopleCatalogRepository('');

    expect(result, isA<PeopleModel>());
  });
}
