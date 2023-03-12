import 'package:dartz/dartz.dart';
import 'package:flutter_star_wars/app/home/domain/entities/people_entity.dart';

import '../errors/errors.dart';
import '../repositories/get_people_repository.dart';

abstract class IGetPeopleUsecase {
  Future<Either<GetPeopleException, List<PeopleEntity>>> call();
}

class GetPeopleUsecase implements IGetPeopleUsecase {
  final GetPeopleRepository repository;

  GetPeopleUsecase(this.repository);
  @override
  Future<Either<GetPeopleException, List<PeopleEntity>>> call() async {
    return await repository.getPeople();
  }
}