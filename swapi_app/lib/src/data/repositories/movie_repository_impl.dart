import 'package:swapi_app/src/data/datasources/remote/movie/movie_remote_data_source.dart';
import 'package:swapi_app/src/domain/entities/movie_entity.dart';
import 'package:swapi_app/src/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl({
    required this.movieRemoteDataSource,
  });

  @override
  Future<MovieEntity> getmovieByUrl({required String url}) async {
    return await movieRemoteDataSource.getMovieByUrl(
      url: url,
    );
  }
}
