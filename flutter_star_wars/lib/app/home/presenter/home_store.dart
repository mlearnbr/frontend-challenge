import 'package:flutter_star_wars/app/home/domain/entities/films_entity.dart';
import 'package:mobx/mobx.dart';

import '../domain/entities/people_entity.dart';
import '../domain/usecases/get_films_usecase.dart';
import '../domain/usecases/get_people_usecase.dart';
import '../domain/usecases/get_species_usecase.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final GetPeopleUsecase getPeopleUsecase;
  final GetSpeciesUsecase getSpeciesUsecase;
  final GetFilmsUsecase getFilmsUsecase;

  _HomeStoreBase(
      this.getPeopleUsecase, this.getSpeciesUsecase, this.getFilmsUsecase);

  @observable
  var listPeople = ObservableList<PeopleEntity>();

  @observable
  var listFilms = ObservableList<FilmsEntity>();

  @observable
  PeopleEntity? characterSelected;

  @observable
  bool isLoading = false;
  @action
  setLoading(bool value) => isLoading = value;

  @observable
  String tabBarSelected = 'INFO';
  @action
  changeTabBar(String tabBar) {
    tabBarSelected = tabBar;
  }

  getThumbnailByFilm(String film){
    switch(film){
      case 'A New Hope':
        return "https://resizing.flixster.com/kMIUvpDVv_oQABEDe1lp-6HDQWw=/206x305/v2/https://flxt.tmsimg.com/assets/p4407_p_v12_ab.jpg";
      case "The Empire Strikes Back":
        return "https://s3.amazonaws.com/nightjarprod/content/uploads/sites/192/2022/04/21120853/k2J0GbxnuWJARxLHa2vAyO77qRX.jpg";
      case "Return of the Jedi":
        break;
      case "The Phantom Menace":
        break;
      case "Attack of the Clones":
        break;
      case "Revenge of the Sith":
        break;
    }
  }

  @observable
  getPeople() async {
    setLoading(true);
    final result = await getPeopleUsecase();
    result.fold((l) {}, (r) => setPeople(r));
    setLoading(false);
  }

  setPeople(List<PeopleEntity> value) {
    listPeople.clear();
    listPeople.addAll(value);
  }

  Future<String>? getSpecies(List url) async {
    var name = '-- --';
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

  getFilms() async {
    final result = await getFilmsUsecase();
    result.fold((l) {}, (r) => listFilms.addAll(r));
  }
}
