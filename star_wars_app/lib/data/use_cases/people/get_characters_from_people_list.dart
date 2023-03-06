import 'package:injectable/injectable.dart';
import 'package:star_wars_app/data/repositories/people_repository.dart';
import 'package:star_wars_app/domain/entities/character_model.dart';

@singleton
class GetPeople {
  final PeopleRepository _peopleRepository;

  GetPeople(this._peopleRepository);

  Future<List<CharacterModel>> getCharacters({required int page}) async {
    return await _peopleRepository.getPeople(page);
  }
}
