import 'package:flutter_test/flutter_test.dart';
import 'package:qualifica_challenge/app/data/models/films_model.dart';
import 'package:qualifica_challenge/app/data/repositories/get_films/get_films_repository.dart';

var films = FilmsModel(
  title: 'A New Hope',
  characters: ["https://swapi.dev/api/people/1/"],
);

List<FilmsModel> listFilms = [
  FilmsModel(
    title: 'A New Hope',
    characters: [
      "https://swapi.dev/api/people/1/",
      "https://swapi.dev/api/people/2/"
    ],
  ),
  FilmsModel(
    title: 'The Empire Strikes Back',
    characters: [
      "https://swapi.dev/api/people/1/",
      "https://swapi.dev/api/people/2/",
      "https://swapi.dev/api/people/3/"
    ],
  ),
];

class GetFilmsRepositoryImpl implements GetFilmsRepository {
  @override
  Future<FilmsModel> getFilmsRepository(String url) async {
    return films;
  }

  @override
  Future<List<FilmsModel>> getFilmsCatalogRepository(String title) async {
    return listFilms;
  }
}

main() {
  GetFilmsRepository repository = GetFilmsRepositoryImpl();

  test("O teste deve retornar um model de films no repository.", () async {
    final result = await repository.getFilmsRepository('');

    expect(result, isA<FilmsModel>());
  });

  test("O teste deve retornar uma lista de films no repository.", () async {
    final result = await repository.getFilmsCatalogRepository('');

    expect(result, isA<List<FilmsModel>>());
  });
}
