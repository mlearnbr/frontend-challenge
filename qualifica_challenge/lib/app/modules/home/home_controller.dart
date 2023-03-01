import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/films_model.dart';
import '../../data/models/homeworld_model.dart';
import '../../data/models/people_model.dart';
import '../../data/models/species_model.dart';
import '../../data/repositories/get_films/get_films_repository_impl.dart';
import '../../data/repositories/get_homeworld/get_homeworld_repository_impl.dart';
import '../../data/repositories/get_people/get_people_repository_impl.dart';
import '../../data/repositories/get_species/get_species_repository_impl.dart';

class HomeController extends GetxController {
  final repositoryPeople = GetPeopleRepositoryImpl();
  RxList<PeopleModel> peopleList = <PeopleModel>[].obs;

  final repositorySpecies = GetSpeciesRepositoryImpl();
  Rx<SpeciesModel> speciesModel = SpeciesModel(name: '').obs;

  final repositoryHomeworld = GetHomeworldRepositoryImpl();
  Rx<HomeworldModel> homeworldModel = HomeworldModel(name: '').obs;

  final repositoryFilms = GetFilmsRepositoryImpl();
  Rx<FilmsModel> filmsModel = FilmsModel(title: '', characters: []).obs;
  RxList<FilmsModel> filmsList = <FilmsModel>[].obs;

  final scrollController = ScrollController();
  RxInt id = 1.obs;

  @override
  onInit() async {
    super.onInit();

    getPeople();

    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        id.value = id.value + 1;

        await getPagination(
          id: id.value,
        );
      }
    });
  }

  Future<List<PeopleModel>> getPeople() async {
    return peopleList.value = await repositoryPeople.getPeopleRepository();
  }

  Future<void> getPagination({required int id}) async {
    for (var character = 1; character <= id; character++) {
      final ids = await repositoryPeople.getPeopleNextIdRepository(id);

      peopleList.addAll(ids);
    }
  }

  Future<SpeciesModel> getSpecies(String species) async {
    speciesModel.value = await repositorySpecies.getSpeciesRepository(species);

    return speciesModel.value;
  }

  Future<HomeworldModel> getHomeworld(String homeworld) async {
    homeworldModel.value =
        await repositoryHomeworld.getHomeworldRepository(homeworld);

    return homeworldModel.value;
  }

  Future<FilmsModel> getFilms(String films) async {
    filmsModel.value = await repositoryFilms.getFilmsRepository(films);

    return filmsModel.value;
  }
}
