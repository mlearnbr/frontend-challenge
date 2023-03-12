import 'package:dartz/dartz.dart';

import '../entities/specie_entity.dart';
import '../errors/errors.dart';
import '../repositories/get_species_by_people_id_repository.dart';

abstract class IGetSpeciesByPeopleIdUsecase {
  Future<Either<GetSpeciesByPeopleIdException, SpecieEntity>> call(String id);
}

class GetSpeciesByPeopleIdUsecase implements IGetSpeciesByPeopleIdUsecase {
  final GetSpeciesByPeopleIdRepository repository;

  GetSpeciesByPeopleIdUsecase(this.repository);
  @override
  Future<Either<GetSpeciesByPeopleIdException, SpecieEntity>> call(String id) async {
    return await repository.getSpeciesByPeopleId(id);
  }
}