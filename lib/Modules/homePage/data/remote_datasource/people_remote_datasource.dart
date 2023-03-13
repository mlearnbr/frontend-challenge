import '../../domain/models/people_model.dart';

abstract class PeopleRemoteDatasource {
  Future<List<People>> getPeoples();
}

class PeopleRemoteDataSourceImplementation implements PeopleRemoteDatasource {
  @override
  Future<List<People>> getPeoples() {
    // TODO: implement getPeoples
    throw UnimplementedError();
  }
}
