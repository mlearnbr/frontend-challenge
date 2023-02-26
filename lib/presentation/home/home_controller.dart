import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../src/interface/interface_provider_character.dart';
import '../../src/interface/interface_provider_films.dart';
import '../../src/model/model_response_films.dart';
import '../../src/model/model_response_people.dart';

class HomeController extends GetxController with StateMixin {
  final InterfaceProviderCharacter interfaceProvider;
  final InterfaceProviderFilms interfaceProviderFilm;
  late final PageController pageController;
  late final PageController innerPageController;
  int idCharacter = 1;
  int idfilter = 1;

  List<ResultCharacter> resultCharacter = [];
  List<ResultCharacter> filterOfFilms = [];

  List<ResultFilms> films = [];
  List caracters = [];

  int currentIndex = 0;
  Duration duration = const Duration(milliseconds: 500);
  HomeController(this.interfaceProvider, this.interfaceProviderFilm);

  currentIndeX(int index) {
    currentIndex = index;
    update();
  }

  Future getCharacter() async {
    try {
      change([], status: RxStatus.loading());
      resultCharacter = await interfaceProvider.getCharacter();
      change([], status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error());
    }
  }

  Future getFilms() async {
    try {
      change([], status: RxStatus.loading());
      films = await interfaceProviderFilm.getFilms();
      change([], status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error());
    }
  }

  Future filterPeopleFilms(List caracters) async {
    try {
      change([], status: RxStatus.loading());

      filterOfFilms = await interfaceProviderFilm.filterPeopleFilms(caracters);
      change([], status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error());
    }
  }

  void cleanListFilter() {
    filterOfFilms.clear();
    update();
  }

  @override
  void onInit() {
    getCharacter();
    getFilms();
    pageController = PageController(initialPage: currentIndex);
    innerPageController =
        PageController(initialPage: currentIndex, viewportFraction: 1 / 1.4);
    super.onInit();
  }
}
