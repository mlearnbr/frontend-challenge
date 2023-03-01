import '../../models/films_model.dart';

abstract class GetFilmsRepository {
  Future<FilmsModel> getFilmsRepository(String url);

  Future<List<FilmsModel>> getFilmsCatalogRepository(String title);
}
