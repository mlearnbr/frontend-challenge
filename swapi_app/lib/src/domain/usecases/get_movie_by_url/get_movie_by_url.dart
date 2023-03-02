import '../../entities/movie_entity.dart';

abstract class GetMovieByUrlUseCase {
  Future<MovieEntity> call({
    required String url,
  });
}
