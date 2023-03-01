import 'package:dio/dio.dart';

import '../../models/people_model.dart';
import 'get_people_repository.dart';

class GetPeopleRepositoryImpl implements GetPeopleRepository {
  final dio = Dio();

  @override
  Future<List<PeopleModel>> getPeopleRepository() async {
    final response = await dio.get('https://swapi.dev/api/people/');

    if (response.statusCode == 200) {
      var result = response.data['results'] as List;

      var listPeople =
          result.map((element) => PeopleModel.fromMap(element)).toList();

      return listPeople;
    } else {
      return throw Exception();
    }
  }

  @override
  Future<List<PeopleModel>> getPeopleNextIdRepository(int nextId) async {
    final response =
        await dio.get('https://swapi.dev/api/people/?page=$nextId');

    if (response.statusCode == 200) {
      var result = response.data['results'] as List;

      var listPeople =
          result.map((element) => PeopleModel.fromMap(element)).toList();

      return listPeople;
    } else {
      return throw Exception();
    }
  }

  @override
  Future<PeopleModel> getPeopleCatalogRepository(String url) async {
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      var result = response.data;

      var people = PeopleModel.fromMap(result);

      return people;
    } else {
      return throw Exception();
    }
  }
}
