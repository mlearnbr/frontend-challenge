import 'package:mobx/mobx.dart';

import '../domain/entities/people_entity.dart';
import '../domain/usecases/get_people_usecase.dart';
import '../domain/usecases/get_species_usecase.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final GetPeopleUsecase getPeopleUsecase;
  final GetSpeciesUsecase getSpeciesUsecase;

  _HomeStoreBase(this.getPeopleUsecase, this.getSpeciesUsecase);

  @observable
  var listPeople = ObservableList<PeopleEntity>();

  @observable
  bool isLoading = false;
  @action
  setLoading(bool value) => isLoading = value;

  getPeople() async {
    setLoading(true);
    final result = await getPeopleUsecase();
    result.fold((l) {
      // print(l.message);
    }, (r) async {
      setPeople(r);
    });
    setLoading(false);
  }

  setPeople(List<PeopleEntity> value) {
    listPeople.clear();
    listPeople.addAll(value);
    // print(listPeople);
  }

  Future<String>? getSpecies(List url) async {
    var name = '';
    if (url.isNotEmpty) {
      var id = url.first
          .toString()
          .replaceAll('https://swapi.dev/api/species/', '')
          .replaceAll('/', '');
      final result = await getSpeciesUsecase(id);
      result.fold((l) {}, (r) {
        name = r.name!;
      });
    }
    return name;
  }
}
