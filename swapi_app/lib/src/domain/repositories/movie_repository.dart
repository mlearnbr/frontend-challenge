import 'package:swapi_app/src/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<MovieEntity> getmovieByUrl({
    required String url,
  });
}
