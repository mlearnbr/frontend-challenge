
import 'package:dartz/dartz.dart';

import '../entities/specie_entity.dart';
import '../errors/errors.dart';

abstract class GetSpeciesRepository {
  Future<Either<GetSpeciesException, SpecieEntity>> getSpecies(String id);
}