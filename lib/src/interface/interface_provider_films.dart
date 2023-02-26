import '../model/model_response_films.dart';
import '../model/model_response_people.dart';

abstract class InterfaceProviderFilms {
  Future<List<ResultFilms>> getFilms();
  Future<List<ResultCharacter>> filterPeopleFilms(List pokemonList);
}
