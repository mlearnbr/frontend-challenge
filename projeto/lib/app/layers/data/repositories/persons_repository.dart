import 'package:flutter_application/app/layers/data/datasources/api/swapi_api_datasource.dart';
import 'package:flutter_application/app/layers/domain/models/person_model.dart';
import 'package:flutter_application/app/layers/domain/models/persons_states_model.dart';

class PersonsRepository {
  final SwapiApiDatasource _apiDatasource;

  PersonsRepository(this._apiDatasource);

  /// Obtem os dez primeiros personagens Starwars.
  /// Caso sucesso, retorna um PersonSuccessState com a lista.
  /// Caso dê erro, retorna um PersonErrorState com
  /// a mensagem de erro em 'errorMessage' e objeto do erro (se houver) em 'erro'.
  Future<PersonsState> getAllPersons() async {
    try {
      var result = await _apiDatasource.getAllPersons();
      if (result.error == null && result.object != null) {
        var list = (result.object as List<Map<String, dynamic>>)
            .map((e) => PersonModel.fromMap(e))
            .toList();

        return PersonsSuccessState(list);
      } else {
        if (result.error == null) {
          return PersonsErrorState('Erro desconhecido', null);
        } else {
          return PersonsErrorState(result.error!, null);
        }
      }
    } catch (e) {
      return PersonsErrorState(e.toString(), e);
    }
  }
}
