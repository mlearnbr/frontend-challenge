import '../interface/interface_provider_films.dart';
import '../model/model_response_films.dart';
import '../model/model_response_people.dart';
import '../repository/repository_get_films.dart';

class ProviderGetFilms implements InterfaceProviderFilms {
  final RepositoryGetFilms repositoryGetFilms;

  ProviderGetFilms(this.repositoryGetFilms);
  @override
  Future<List<ResultFilms>> getFilms() async {
    final response = await repositoryGetFilms.getFilms();
    return response;
  }

  @override
  Future<List<ResultCharacter>> filterPeopleFilms(List pokemonList) {
    return repositoryGetFilms.filterPeopleFilms(pokemonList);
  }
}
