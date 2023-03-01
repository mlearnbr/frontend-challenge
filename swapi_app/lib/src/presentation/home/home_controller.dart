import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapi_app/src/domain/entities/people_entity.dart';
import 'package:swapi_app/src/domain/usecases/get_peoples/get_peoples_usecase.dart';

class HomeController extends GetxController {
  late final ScrollController scrollController;

  GetPeoplesUseCase getPeoplesUseCase;

  HomeController({
    required this.getPeoplesUseCase,
  });

  final Rx<bool> _loading = true.obs;
  final RxList<PeopleEntity> _peoples = <PeopleEntity>[].obs;
  int? _nextPage = 1;

  bool get loading => _loading.value;
  List<PeopleEntity> get peoples => _peoples.toList();
  bool get initLoading => loading && peoples.isEmpty;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(infiniteScrolling);
    _initList();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  Future<void> _initList() async {
    try {
      _loading.value = true;
      final result = await getPeoplesUseCase.call();
      _loading.value = false;
      _peoples.addAll(result.result);
      _nextPage = 2;
    } catch (e) {
      print(e);
    }
  }

  void infiniteScrolling() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !_loading.value &&
        _nextPage != null) {
      loadPeoples(
        page: _nextPage!,
      );
    }
  }

  Future<void> loadPeoples({int page = 1}) async {
    try {
      _loading.value = true;
      final result = await getPeoplesUseCase.call(
        page: _nextPage!,
      );
      _peoples.addAll(result.result);
      if (result.next != null) {
        _nextPage = _nextPage! + 1;
      } else {
        _nextPage = null;
      }
      _loading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
