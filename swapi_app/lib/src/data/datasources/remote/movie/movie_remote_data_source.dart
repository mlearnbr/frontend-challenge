import 'package:swapi_app/src/data/dtos/movie_dto.dart';

abstract class MovieRemoteDataSource {
  Future<MovieDto> getMovieByUrl({
    required String url,
  });
}
