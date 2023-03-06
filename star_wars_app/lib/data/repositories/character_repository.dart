import 'package:injectable/injectable.dart';
import 'package:star_wars_app/data/data_sources/character/character_data_source.dart';
import 'package:star_wars_app/domain/entities/character_model.dart';

@injectable
class CharacterRepository {
  final CharacterDataSource _dataSource;

  CharacterRepository(this._dataSource);

  Future<CharacterModel?> getCharacter(String url) async {
    return await _dataSource.getCharacter(url);
  }
}
