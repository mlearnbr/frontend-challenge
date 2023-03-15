import '../../../../../Core/data/http/http_client.dart';
import '../../../../../Core/data/http/http_error.dart';

import '../../../../../Core/data/mappers/planet/planet_mapper.dart';
import '../../../../../Core/domain/models/planet_model.dart';
import '../../../../../Core/enums/methods_enum.dart';

abstract class PlanetRemoteDatasource {
  Future<Planet> getPlanet(String planetUrl);
}

class PlanetRemoteDataSourceImplementation implements PlanetRemoteDatasource {
  final HttpClient httpClient;

  PlanetRemoteDataSourceImplementation(this.httpClient);
  @override
  Future<Planet> getPlanet(String planetUrl) async {
    try {
      var homeWorld =
          await httpClient.request(url: planetUrl, method: MethodEnum.get);
      final mappedPlanet = PlanetMapper.fromMap(homeWorld);

      return mappedPlanet;
    } on HttpError {
      rethrow;
    }
  }
}
