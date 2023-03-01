import 'package:dio/dio.dart';

import '../../models/films_model.dart';
import 'get_films_repository.dart';

class GetFilmsRepositoryImpl implements GetFilmsRepository {
  final dio = Dio();

  @override
  Future<FilmsModel> getFilmsRepository(String url) async {
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      var result = response.data;

      var films = FilmsModel.fromMap(result);

      return films;
    } else {
      return throw Exception();
    }
  }

  @override
  Future<List<FilmsModel>> getFilmsCatalogRepository(String title) async {
    final response =
        await dio.get('https://swapi.dev/api/films/?search=$title');

    if (response.statusCode == 200) {
      var result = response.data['results'] as List;

      var listFilms =
          result.map((element) => FilmsModel.fromMap(element)).toList();

      return listFilms;
    } else {
      return throw Exception();
    }
  }
}
