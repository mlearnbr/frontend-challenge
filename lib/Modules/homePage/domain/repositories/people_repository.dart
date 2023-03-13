import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures/failure.dart';
import '../models/people_model.dart';

abstract class PeopleRepository {
  Future<Either<Failure, List<People>>> getPeoples();
}
