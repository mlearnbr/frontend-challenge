import 'package:challenge/Core/data/http/http.dart';
import 'package:challenge/Modules/homePage/data/mappers/people/people_mapper.dart';

import '../../domain/models/people_model.dart';

abstract class PeopleRemoteDatasource {
  Future<List<People>> getPeoples();
}

class PeopleRemoteDataSourceImplementation implements PeopleRemoteDatasource {
  final HttpClient<Map<String, dynamic>> httpClient;

  PeopleRemoteDataSourceImplementation(this.httpClient);
  @override
  Future<List<People>> getPeoples() async {
    try {
      final response = await httpClient.request(url: 'url', method: 'get');
      return PeopleMapper.fromMap(response);
    } on HttpError {
      rethrow;
    }
  }
}
