import 'package:swapi_app/src/data/datasources/remote/specie/specie_remote_data_source.dart';
import 'package:swapi_app/src/domain/entities/specie_entity.dart';
import 'package:swapi_app/src/domain/repositories/species_repository.dart';

class SpeciesRepositoryImpl extends SpeciesRepository {
  final SpecieRemoteDataSource specieRemoteDataSource;

  SpeciesRepositoryImpl({
    required this.specieRemoteDataSource,
  });

  @override
  Future<SpecieEntity> getSpecieByUrl({
    required String url,
  }) async {
    return await specieRemoteDataSource.getSpecieByUrl(
      url: url,
    );
  }
}
