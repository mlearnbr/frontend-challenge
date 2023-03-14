import '../../../../../Core/data/http/http_client.dart';
import '../../../../../Core/data/http/http_error.dart';
import '../../../../../Core/enums/methods_enum.dart';

import '../../../../../Core/domain/models/film_model.dart';
import '../../../../../Core/data/mappers/film/film_mapper.dart';

abstract class FilmRemoteDatasource {
  Future<Film> getFilm(String filmUrl);
}

class FilmRemoteDataSourceImplementation implements FilmRemoteDatasource {
  final HttpClient httpClient;

  FilmRemoteDataSourceImplementation(this.httpClient);
  @override
  Future<Film> getFilm(String filmUrl) async {
    try {
      final response =
          await httpClient.request(url: filmUrl, method: MethodEnum.get);
      return FilmMapper.fromMap(response);
    } on HttpError {
      rethrow;
    }
  }
}
