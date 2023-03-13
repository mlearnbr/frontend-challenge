import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures/failure.dart';
import '../models/people_model.dart';
import '../repositories/people_repository.dart';

class GetPeoplesUseCase {
  final PeopleRepository peopleRepository;

  GetPeoplesUseCase({required this.peopleRepository});

  Future<Either<Failure, List<People>>> call() async {
    return await peopleRepository.getPeoples();
  }
}
