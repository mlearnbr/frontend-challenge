import 'package:dartz/dartz.dart';

import '../../domain/entities/specie_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositiories/get_species_repository.dart';
import '../datasources/get_species_datasource.dart';

class GetSpeciesRepositoryImpl implements GetSpeciesRepository {
  final GetSpeciesDatasource datasource;

  GetSpeciesRepositoryImpl(this.datasource);
  @override
  Future<Either<GetSpeciesException, SpecieEntity>>
      getSpecies(String id) async {
    try {
      return Right(await datasource.getSpecies(id));
    } on GetSpeciesException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GetSpeciesException(e.toString()));
    }
  }
}