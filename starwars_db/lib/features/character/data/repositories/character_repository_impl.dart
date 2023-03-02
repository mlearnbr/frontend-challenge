import 'package:starwars_db/features/character/data/data_sources/character_remote_data_source.dart';
import 'package:starwars_db/features/character/domain/entities/character.dart';
import 'package:starwars_db/features/character/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<Character>> listCharacters() {
    return remoteDataSource.listCharacters();
  }
}
