import 'package:dartz/dartz.dart';

import '../../../../../Core/domain/models/people_model.dart';
import '../../../../../Core/errors/exceptions/base_exceptions.dart';
import '../../../../../Core/errors/failures/failure.dart';
import '../../../domain/repositories/people/people_repository.dart';
import '../../remote_datasource/people/people_remote_datasource.dart';

class PeopleRepositoryImplementation implements PeopleRepository {
  final PeopleRemoteDatasource remoteDatasource;
  PeopleRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<People>>> getPeoples() async {
    try {
      final result = await remoteDatasource.getPeoples();
      return right(result);
    } on CacheException {
      return left(CacheFailure());
    }
  }
}
