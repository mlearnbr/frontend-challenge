import 'package:starwars_db/features/character/domain/entities/character.dart';
import 'package:starwars_db/features/character/domain/repositories/character_repository.dart';

class ListCharactersUsecase {
  final CharacterRepository repository;

  const ListCharactersUsecase(this.repository);

  Future<List<Character>> call() async {
    return await repository.listCharacters();
  }
}
