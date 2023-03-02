import 'package:swapi_app/shared/errors/failure.dart';
import 'package:swapi_app/shared/services/http_manager.dart';
import 'package:swapi_app/src/data/datasources/remote/movie/movie_remote_data_source.dart';
import 'package:swapi_app/src/data/dtos/movie_dto.dart';

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final HttpManager manager;

  MovieRemoteDataSourceImpl({
    required this.manager,
  });

  @override
  Future<MovieDto> getMovieByUrl({
    required String url,
  }) async {
    final response = await manager.restRequest(
      url: url,
      method: HttpMethods.get,
      queryParameters: {
        'format': 'json',
      },
    );
    if (!response.containsKey("message")) {
      return MovieDto.fromMap(response);
    }
    throw Failure.fromMap(response);
  }
}
