import 'package:dartz/dartz.dart';

import '../entities/specie_entity.dart';
import '../errors/errors.dart';
import '../repositiories/get_species_repository.dart';

abstract class IGetSpeciesUsecase {
  Future<Either<GetSpeciesException, SpecieEntity>> call(String id);
}

class GetSpeciesUsecase implements IGetSpeciesUsecase {
  final GetSpeciesRepository repository;

  GetSpeciesUsecase(this.repository);
  @override
  Future<Either<GetSpeciesException, SpecieEntity>> call(String id) async {
    return await repository.getSpecies(id);
  }
}