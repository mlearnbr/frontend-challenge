import 'package:injectable/injectable.dart';
import 'package:star_wars_app/data/repositories/character_repository.dart';
import 'package:star_wars_app/domain/entities/character_model.dart';

@singleton
class GetCharacter {
  final CharacterRepository _characterRepository;

  GetCharacter(this._characterRepository);

  Future<CharacterModel?> getCharacter({required String url}) async {
    return await _characterRepository.getCharacter(url);
  }
}
