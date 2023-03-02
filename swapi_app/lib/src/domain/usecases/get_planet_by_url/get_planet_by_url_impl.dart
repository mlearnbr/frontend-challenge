import 'package:swapi_app/src/domain/entities/planet_entity.dart';
import 'package:swapi_app/src/domain/repositories/planet_repository.dart';
import 'package:swapi_app/src/domain/usecases/get_planet_by_url/get_planet_by_url.dart';

class GetPlanetByUrlUseCaseImpl implements GetPlanetByUrlUseCase {
  final PlanetRepository repository;

  GetPlanetByUrlUseCaseImpl({required this.repository});

  @override
  Future<PlanetEntity> call({required String url}) async {
    return await repository.getPlanetByUrl(
      url: url,
    );
  }
}
