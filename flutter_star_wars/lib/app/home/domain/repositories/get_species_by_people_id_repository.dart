
import 'package:dartz/dartz.dart';

import '../entities/specie_entity.dart';
import '../errors/errors.dart';

abstract class GetSpeciesByPeopleIdRepository {
  Future<Either<GetSpeciesByPeopleIdException, SpecieEntity>> getSpeciesByPeopleId(String id);
}