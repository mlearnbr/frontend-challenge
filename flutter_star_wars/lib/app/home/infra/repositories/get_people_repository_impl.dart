import 'package:dartz/dartz.dart';
import 'package:flutter_star_wars/app/home/domain/entities/people_entity.dart';

import '../../domain/errors/errors.dart';
import '../../domain/repositories/get_people_repository.dart';
import '../datasources/get_people_datasource.dart';

class GetPeopleRepositoryImpl implements GetPeopleRepository {
  final GetPeopleDatasource datasource;

  GetPeopleRepositoryImpl(this.datasource);
  @override
  Future<Either<GetPeopleException, List<PeopleEntity>>>
      getPeople() async {
    try {
      return Right(await datasource.getPeople());
    } on GetPeopleException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GetPeopleException(e.toString()));
    }
  }
}