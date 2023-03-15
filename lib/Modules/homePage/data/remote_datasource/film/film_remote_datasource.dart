import '../../../../../Core/data/http/http_client.dart';
import '../../../../../Core/data/http/http_error.dart';
import '../../../../../Core/enums/methods_enum.dart';

import '../../../../../Core/domain/models/film_model.dart';
import '../../../../../Core/data/mappers/film/film_mapper.dart';

abstract class FilmRemoteDatasource {
  Future<List<Film>> getFilms(List<String> filmUrl);
}

class FilmRemoteDataSourceImplementation implements FilmRemoteDatasource {
  final HttpClient httpClient;

  FilmRemoteDataSourceImplementation(this.httpClient);
  @override
  Future<List<Film>> getFilms(List<String> filmUrl) async {
    List<Film> filmList = [];
    try {
      for (var url in filmUrl) {
        var film = await httpClient.request(url: url, method: MethodEnum.get);
        final mappedFilm = FilmMapper.fromMap(film);
        filmList.add(mappedFilm);
      }

      return filmList;
    } on HttpError {
      rethrow;
    }
  }
}
