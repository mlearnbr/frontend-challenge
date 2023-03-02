import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:starwars_db/features/character/data/models/character_model.dart';

class CharacterRemoteDataSource {
  final http.Client client;

  const CharacterRemoteDataSource({
    required this.client,
  });

  Future<List<CharacterModel>> listCharacters() async {
    const firstUrl = 'https://swapi.dev/api/people/?page=1';
    return _listCharacterByPage([], firstUrl);
  }

  ///
  /// IMPORTANT: This method is not great for real world usage, since we need
  /// to wait for the whole list to load at once.
  /// For a better experience we would need to implement it in a way that
  /// allowed us to call it page by page to give faster results to the user.
  ///
  Future<List<CharacterModel>> _listCharacterByPage(
    List<CharacterModel> loadedCharacters,
    String url,
  ) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json;'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final newCharacters = data['results']
          .map((it) => CharacterModel.fromJson(it))
          .toList()
          .cast<CharacterModel>();
      final nextUrl = data['next'];

      if (nextUrl == null) {
        // no more pages available, return the characters
        return loadedCharacters..addAll(newCharacters);
      } else {
        // call the next page
        return _listCharacterByPage(
          loadedCharacters..addAll(newCharacters),
          nextUrl,
        );
      }
    } else {
      throw Exception('Server Exception');
    }
  }
}
