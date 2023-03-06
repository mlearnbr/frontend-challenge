import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:star_wars_app/domain/entities/character_model.dart';
import 'package:star_wars_app/domain/entities/people_model.dart';

@injectable
class PeopleDataSource {
  late Dio _dio;

  PeopleDataSource() {
    _dio = Dio();
  }

  Future<List<CharacterModel>> getCharactersFromPeopleList(int page) async {
    var queryParameters = {
      'page': page,
    };

    final res = await _dio.get(
      'https://swapi.dev/api/people',
      queryParameters: queryParameters,
    );

    try {
      if (res.statusCode == 200) {
        var characterList = <CharacterModel>[];
        final peopleData = res.data as Map<String, dynamic>;
        final people = PeopleModel.fromJson(peopleData);

        if (people.results != null) {
          for (var character in people.results!) {
            characterList.add(character);
          }
        }

        return characterList;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
