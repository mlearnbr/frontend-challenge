
import 'package:dartz/dartz.dart';
import 'package:flutter_star_wars/app/home/domain/entities/people_entity.dart';

import '../errors/errors.dart';

abstract class GetPeopleRepository {
  Future<Either<GetPeopleException, List<PeopleEntity>>> getPeople();
}