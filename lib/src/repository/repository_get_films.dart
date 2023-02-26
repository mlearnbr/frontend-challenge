import 'package:get/get.dart';

import '../base_url/base_url_api.dart';
import '../interface/interface_repository_films.dart';
import '../model/model_response_films.dart';
import '../model/model_response_people.dart';

class RepositoryGetFilms implements InterfaceRepositoryFilms {
  final GetConnect getconnect;
  List<ResultFilms> filme = [];
  List<ResultCharacter> peaple = [];

  RepositoryGetFilms(this.getconnect);
  @override
  Future<List<ResultFilms>> getFilms() async {
    final response = await getconnect.get(BaseUrlApi.filme);
    final convertToString = response.bodyString;

    if (response.statusCode == 200) {
      final model = responseModelFilmsFromJson(convertToString!);
      filme = model.results;
    }
    return filme;
  }

  @override
  Future<List<ResultCharacter>> filterPeopleFilms(List pokemonList) async {
    for (var item in pokemonList) {
      final response = await getconnect.get(item);
      String convertToString = response.bodyString!;
      if (response.statusCode == 200) {
        peaple.add(responseModelPeopleFilterFromJson(convertToString));
        print(peaple);
      }
    }
    return peaple;
  }
}
