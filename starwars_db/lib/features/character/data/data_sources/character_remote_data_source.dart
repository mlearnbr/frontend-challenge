import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:starwars_db/features/character/data/models/character_model.dart';

class CharacterRemoteDataSource {
  final http.Client client;

  const CharacterRemoteDataSource({
    required this.client,
  });

  // TODO also get the other pages
  Future<List<CharacterModel>> listCharacters() async {
    const url = 'https://swapi.dev/api/people/?page=1';
    final response = await client.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json;'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results']
          .map((it) => CharacterModel.fromJson(it))
          .toList()
          .cast<CharacterModel>();
    } else {
      throw Exception('Server Exception');
    }
  }
}
