import 'dart:convert';

import 'package:flutter_star_wars/app/home/domain/entities/people_entity.dart';
import 'package:http/http.dart' as http;

import '../../infra/datasources/get_people_datasource.dart';
import '../mapper.dart';

class HttpGetPeople implements GetPeopleDatasource {
  @override
  Future<List<PeopleEntity>> getPeople() async {
    // try {
    var response = await http.get(Uri.parse('https://swapi.dev/api/people/'),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Content-Type': 'application/json'
        }).timeout(const Duration(seconds: 120));
    // if (response.statusCode == 200) {
    // print(response.body);
    return PeopleMapper.fromList(jsonDecode(response.body)["results"]);
    //   } else {
    //     throw GetPeopleException(jsonDecode(response.body)["message"]);
    //   }
    // } catch (e) {
    //   throw GetPeopleException(e.toString());
    // }
  }
}
