import 'package:swapi_app/src/data/datasources/remote/planet/planet_remote_data_source.dart';
import 'package:swapi_app/src/domain/entities/planet_entity.dart';
import 'package:swapi_app/src/domain/repositories/planet_repository.dart';

class PlanetRepositoryImpl extends PlanetRepository {
  final PlanetRemoteDataSource planetRemoteDataSource;

  PlanetRepositoryImpl({
    required this.planetRemoteDataSource,
  });

  @override
  Future<PlanetEntity> getPlanetByUrl({
    required String url,
  }) async {
    return await planetRemoteDataSource.getPlanet(
      url: url,
    );
  }
}
