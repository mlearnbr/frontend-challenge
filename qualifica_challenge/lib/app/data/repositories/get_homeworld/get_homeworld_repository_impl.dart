import 'package:dio/dio.dart';

import '../../models/homeworld_model.dart';
import 'get_homeworld_repository.dart';

class GetHomeworldRepositoryImpl implements GetHomeworldRepository {
  final dio = Dio();

  @override
  Future<HomeworldModel> getHomeworldRepository(String url) async {
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      var result = response.data;

      var homeWorld = HomeworldModel.fromMap(result);

      return homeWorld;
    } else {
      return throw Exception();
    }
  }
}
