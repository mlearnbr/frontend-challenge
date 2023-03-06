import 'package:injectable/injectable.dart';
import 'package:star_wars_app/data/data_sources/people/people_data_source.dart';
import 'package:star_wars_app/domain/entities/character_model.dart';

@injectable
class PeopleRepository {
  final PeopleDataSource _dataSource;

  PeopleRepository(this._dataSource);

  Future<List<CharacterModel>> getPeople(int page) async {
    return await _dataSource.getCharactersFromPeopleList(page);
  }
}
