import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures/failure.dart';
import '../models/people_model.dart';
import '../repositories/people_repository.dart';

class GetPeopleUseCase {
  final PeopleRepository peopleRepository;

  GetPeopleUseCase({required this.peopleRepository});

  Future<Either<Failure, List<People>>> call() async {
    return await peopleRepository.getPeoples();
  }
}
