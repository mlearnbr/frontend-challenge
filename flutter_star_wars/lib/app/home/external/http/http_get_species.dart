import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entities/specie_entity.dart';
import '../../domain/errors/errors.dart';
import '../../infra/datasources/get_species_datasource.dart';
import '../mapper.dart';

class HttpGetSpecies implements GetSpeciesDatasource {
  @override
  Future<SpecieEntity> getSpecies(String id) async {
    try {
      var response = await http
          .get(Uri.parse('https://swapi.dev/api/species/$id/'), headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json'
      }).timeout(const Duration(seconds: 120));
      if (response.statusCode == 200) {
          return SpecieMapper.fromJson(jsonDecode(response.body));
      } else {
        throw GetSpeciesException(jsonDecode(response.body)["message"]);
      }
    } catch (e) {
      throw GetSpeciesException(e.toString());
    }
  }
}
