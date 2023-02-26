import 'package:flutter/foundation.dart';
import 'package:star_wars_app/app/layers/data/repositories/persons_repository.dart';
import 'package:star_wars_app/app/layers/domain/models/person_model.dart';
import 'package:star_wars_app/app/layers/domain/states/persons_states_model.dart';

class PersonsController {
  final PersonsRepository _personsRepository;

  var personsState = ValueNotifier<PersonsState>(PersonInitialState());

  PersonModel? personSelected;

  PersonsController(this._personsRepository);

  isLoadingPerson() {
    personsState.value = PersonLoadingState();
    //  personsState.notifyListeners();
  }

  /// Carrega a lista de personagens na home page (primeira pagina apenas)
  loadingListHome() async {
    isLoadingPerson();

    var result = await _personsRepository.getAllPersons();

    personsState.value = result;
  }

  /// busca o nome da especie usando a url passado por parametro
  /// get specie name using url passed by  parameter
  Future<String> getSpecie(String specieUrl) =>
      _personsRepository.getNameSpecie(specieUrl);
}
