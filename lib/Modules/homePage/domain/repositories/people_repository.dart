import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures/failure.dart';
import '../../../../Core/domain/models/people_model.dart';

abstract class PeopleRepository {
  Future<Either<Failure, List<People>>> getPeoples();
}
