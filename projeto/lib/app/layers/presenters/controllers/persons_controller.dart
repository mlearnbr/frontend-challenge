// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/foundation.dart';
import 'package:star_wars_app/app/layers/data/repositories/persons_repository.dart';
import 'package:star_wars_app/app/layers/domain/models/person_model.dart';
import 'package:star_wars_app/app/layers/domain/states/persons_states_model.dart';
import 'package:star_wars_app/app/shared/helpers/const_films.dart';

class PersonsController {
  final PersonsRepository _personsRepository;

  var personsState = ValueNotifier<PersonsState>(PersonInitialState());

  PersonModel? personSelected;

  PersonsController(this._personsRepository);

  var filterFilm = ValueNotifier<List<String>>([]);

  /// add film to filter list and refresh valuenotifier
  filterFilmAdd(String text) {
    filterFilm.value.clear();
    filterFilm.value.add(text);
    filterFilm.notifyListeners();
    loadingListHome();
  }

  /// remove film to filter list and refresh valuenotifier
  filterFilmRemove(String text) {
    filterFilm.value.remove(text);
    filterFilm.notifyListeners();
    loadingListHome();
  }

  isLoadingPerson() {
    personsState.value = PersonLoadingState();
    //  personsState.notifyListeners();
  }

  /// Carrega a lista de personagens na home page (primeira pagina apenas)
  /// Load persons list in homepage (top 10)
  loadingListHome() async {
    isLoadingPerson();
    if (filterFilm.value.isEmpty) {
      var result = await _personsRepository.getAllPersons();

      personsState.value = result;
    } else {
      var indexFilm = listFilms.indexOf(filterFilm.value.first);
      var result =
          await _personsRepository.getPersonsFilmFilter(indexFilm.toString());

      personsState.value = result;
    }
  }

  /// busca o nome da especie usando a url passado por parametro
  /// get specie name using url passed by  parameter
  Future<String> getSpecie(String specieUrl) =>
      _personsRepository.getNameSpecie(specieUrl);
}
