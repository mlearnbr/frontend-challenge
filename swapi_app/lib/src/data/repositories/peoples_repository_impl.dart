import 'package:swapi_app/src/data/datasources/remote/people/peoples_remote_data_source.dart';
import 'package:swapi_app/src/domain/entities/response/peoples_response.dart';
import 'package:swapi_app/src/domain/repositories/peoples_repository.dart';

class PeoplesRepositoryImpl extends PeoplesRepository {
  final PeoplesRemoteDataSource peoplesRemoteDataSource;

  PeoplesRepositoryImpl({
    required this.peoplesRemoteDataSource,
  });

  @override
  Future<PeoplesResponse> getPeoples({
    int page = 1,
  }) async {
    return await peoplesRemoteDataSource.getPeoples(
      page: page,
    );
  }

  @override
  Future<PeoplesResponse> getPeoplesByName({
    int page = 1,
    required String name,
  }) async {
    return await peoplesRemoteDataSource.getPeoplesByName(
      name: name,
      page: page,
    );
  }
}
