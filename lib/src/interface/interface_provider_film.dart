import '../model/model_response_films.dart';

abstract class InterfaceProviderFilm {
  Future<List<ResultFilme>> getFilmes();
}
