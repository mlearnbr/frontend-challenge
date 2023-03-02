import 'package:swapi_app/shared/errors/failure.dart';
import 'package:swapi_app/shared/services/http_manager.dart';
import 'package:swapi_app/src/data/datasources/remote/planet/planet_remote_data_source.dart';
import 'package:swapi_app/src/data/dtos/planet_dto.dart';

class PlanetRemoteDataSourceImpl extends PlanetRemoteDataSource {
  final HttpManager manager;
  PlanetRemoteDataSourceImpl({
    required this.manager,
  });

  @override
  Future<PlanetDto> getPlanet({required String url}) async {
    final response = await manager.restRequest(
      url: url,
      method: HttpMethods.get,
      queryParameters: {
        'format': 'json',
      },
    );
    if (!response.containsKey("message")) {
      return PlanetDto.fromMap(response);
    }
    throw Failure.fromMap(response);
  }
}
