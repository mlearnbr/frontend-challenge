import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entities/specie_entity.dart';
import '../../domain/errors/errors.dart';
import '../../infra/datasources/get_species_by_people_id_datasource.dart';
import '../mapper.dart';

class HttpGetSpeciesByPeopleId implements GetSpeciesByPeopleIdDatasource {
  @override
  Future<SpecieEntity> getSpeciesByPeopleId(String id) async {
    try {
      var response = await http
          .get(
            Uri.parse('https://swapi.dev/api/species/$id/'),
          )
          .timeout(const Duration(seconds: 120));
      if (response.statusCode == 200) {
        return SpecieMapper.fromJson(jsonDecode(response.body));
      } else {
        throw GetSpeciesByPeopleIdException(jsonDecode(response.body)["message"]);
      }
    } catch (e) {
      throw GetSpeciesByPeopleIdException(e.toString());
    }
  }
}
