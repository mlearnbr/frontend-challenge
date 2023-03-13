import 'package:challenge/Modules/homePage/domain/models/people_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../Core/errors/exceptions/base_exceptions.dart';
import '../../../../Core/errors/failures/failure.dart';
import '../../domain/repositories/people_repository.dart';
import '../remote_datasource/people_remote_datasource.dart';

class PeopleRepositoryImplementation implements PeopleRepository {
  final PeopleRemoteDatasource localDatasource;
  PeopleRepositoryImplementation({required this.localDatasource});

  @override
  Future<Either<Failure, List<People>>> getPeoples() async {
    try {
      final result = await localDatasource.getPeoples();
      return right(result);
    } on CacheException {
      return left(CacheFailure());
    }
  }
}
