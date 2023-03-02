import 'package:swapi_app/src/domain/entities/movie_entity.dart';
import 'package:swapi_app/src/domain/repositories/movie_repository.dart';
import 'package:swapi_app/src/domain/usecases/get_movie_by_url/get_movie_by_url.dart';

class GetMovieByUrlUseCaseImpl implements GetMovieByUrlUseCase {
  final MovieRepository repository;

  GetMovieByUrlUseCaseImpl({required this.repository});

  @override
  Future<MovieEntity> call({
    required String url,
  }) async {
    return await repository.getmovieByUrl(
      url: url,
    );
  }
}
