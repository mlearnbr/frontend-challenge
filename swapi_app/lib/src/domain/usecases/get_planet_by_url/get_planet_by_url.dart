import 'package:swapi_app/src/domain/entities/planet_entity.dart';

abstract class GetPlanetByUrlUseCase {
  Future<PlanetEntity> call({
    required String url,
  });
}
