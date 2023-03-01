import 'package:dio/dio.dart';

import '../../models/species_model.dart';
import 'get_species_repository.dart';

class GetSpeciesRepositoryImpl implements GetSpeciesRepository {
  final dio = Dio();

  @override
  Future<SpeciesModel> getSpeciesRepository(String url) async {
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      var result = response.data;

      var species = SpeciesModel.fromMap(result);

      return species;
    } else {
      return throw Exception();
    }
  }
}
