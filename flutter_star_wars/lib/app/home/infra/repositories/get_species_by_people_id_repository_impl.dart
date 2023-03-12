import 'package:dartz/dartz.dart';

import '../../domain/entities/specie_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/get_species_by_people_id_repository.dart';
import '../datasources/get_species_by_people_id_datasource.dart';

class GetSpeciesByPeopleIdRepositoryImpl implements GetSpeciesByPeopleIdRepository {
  final GetSpeciesByPeopleIdDatasource datasource;

  GetSpeciesByPeopleIdRepositoryImpl(this.datasource);
  @override
  Future<Either<GetSpeciesByPeopleIdException, SpecieEntity>>
      getSpeciesByPeopleId(String id) async {
    try {
      return Right(await datasource.getSpeciesByPeopleId(id));
    } on GetSpeciesByPeopleIdException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GetSpeciesByPeopleIdException(e.toString()));
    }
  }
}