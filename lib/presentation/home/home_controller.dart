import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../src/interface/interface_provider.dart';
import '../../src/model/model_response_people.dart';

class HomeController extends GetxController with StateMixin {
  final InterfaceProvider interfaceProvider;
  late final PageController pageController;
  late final PageController innerPageController;
  int idCharacter = 1;
  List<ResultCharacter> resultCharacter = [];
  int currentIndex = 0;
  Duration duration = const Duration(milliseconds: 500);
  HomeController(this.interfaceProvider);

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

  @override
  void onInit() {
    getCharacter();
    pageController = PageController(initialPage: currentIndex);
    innerPageController =
        PageController(initialPage: currentIndex, viewportFraction: 1 / 1.4);
    super.onInit();
  }
}
