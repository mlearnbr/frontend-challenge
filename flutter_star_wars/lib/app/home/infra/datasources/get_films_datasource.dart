
import '../../domain/entities/films_entity.dart';

abstract class GetFilmsDatasource {
  Future<List<FilmsEntity>> getFilms();
}