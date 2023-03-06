import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:star_wars_app/domain/entities/character_model.dart';

@injectable
class CharacterDataSource {
  late Dio _dio;

  CharacterDataSource() {
    _dio = Dio();
  }

  Future<CharacterModel?> getCharacter(String url) async {
    final res = await _dio.get(
      url,
    );

    try {
      if (res.statusCode == 200) {
        final characterData = res.data as Map<String, dynamic>;
        return CharacterModel.fromJson(characterData);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
