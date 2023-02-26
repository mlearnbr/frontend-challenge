import '../model/model_response_films.dart';
import '../model/model_response_people.dart';

abstract class InterfaceRepositoryFilms {
  Future<List<ResultFilms>> getFilms();
  Future<List<ResultCharacter>> filterPeopleFilms(List filterList);
  Future<List<ResultFilms>> filterFilmByPeopleFilms(List filterList);
}
