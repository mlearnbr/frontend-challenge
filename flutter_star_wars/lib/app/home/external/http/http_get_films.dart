import 'dart:convert';

import 'package:flutter_star_wars/app/home/external/mapper.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/films_entity.dart';
import '../../domain/errors/errors.dart';
import '../../infra/datasources/get_films_datasource.dart';

class HttpGetFilms implements GetFilmsDatasource {
  @override
  Future<List<FilmsEntity>> getFilms() async {
    try {
      var response = await http
          .get(
            Uri.parse('https://swapi.dev/api/films/'),
          )
          .timeout(const Duration(seconds: 120));
      if (response.statusCode == 200) {
        return FilmMapper.fromList(jsonDecode(response.body)['results']);
      } else {
        throw GetFilmsException(jsonDecode(response.body)["message"]);
      }
    } catch (e) {
      throw GetFilmsException(e.toString());
    }
  }
}
