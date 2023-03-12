import 'package:flutter/material.dart';
import 'package:flutter_star_wars/app/home/domain/entities/films_entity.dart';
import 'package:flutter_star_wars/app/utils/app_images.dart';
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
  FilmsEntity? filmSelected;

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

  getThumbnailByFilm(String film) {
    switch (film) {
      case 'A New Hope':
        return AppImages.filmNewHope;
      case "The Empire Strikes Back":
        return AppImages.filmTheEmpireStrikes;
      case "Return of the Jedi":
        return AppImages.filmReturnOfTheJedi;
      case "The Phantom Menace":
        return AppImages.filmThePhantomMenace;
      case "Attack of the Clones":
        return AppImages.filmAttackOfTheClones;
      case "Revenge of the Sith":
        return AppImages.filmRevengeOfTheSith;
    }
  }

  getImageCharacter(String film) {
    switch (film) {
      case "Luke Skywalker":
        return '${AppImages.charactersImages}1.jpg';
      case "C-3PO":
        return '${AppImages.charactersImages}2.jpg';
      case "R2-D2":
        return '${AppImages.charactersImages}3.jpg';
      case "Darth Vader":
        return '${AppImages.charactersImages}4.jpg';
      case "Leia Organa":
        return '${AppImages.charactersImages}5.jpg';
      case "Owen Lars":
        return '${AppImages.charactersImages}6.jpg';
      case "Beru Whitesun lars":
        return '${AppImages.charactersImages}7.jpg';
      case "R5-D4":
        return '${AppImages.charactersImages}8.jpg';
      case "Biggs Darklighter":
        return '${AppImages.charactersImages}9.jpg';
      case "Obi-Wan Kenobi":
        return '${AppImages.charactersImages}10.jpg';
    }
  }

  getPeople() async {
    setLoading(true);
    final result = await getPeopleUsecase();
    result.fold((l) {
      AlertDialog(
        content: const Text('An error occurred while fetching the characters.'),
        actions: [TextButton(onPressed: () {
          getPeople();
        }, child: const Text('Try again'))],
      );
    }, (r) => setPeople(r));
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
