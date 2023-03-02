import 'package:starwars_db/features/character/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> listCharacters();
}
