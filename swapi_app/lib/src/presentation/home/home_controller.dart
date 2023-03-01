import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapi_app/src/domain/entities/people_entity.dart';
import 'package:swapi_app/src/domain/usecases/get_peoples/get_peoples_usecase.dart';
import 'package:swapi_app/src/domain/usecases/get_peoples_by_name/get_peoples_by_name.dart';

class HomeController extends GetxController {
  late final ScrollController scrollController;

  GetPeoplesUseCase getPeoplesUseCase;
  GetPeoplesByNameUseCase getPeoplesByNameUseCase;

  HomeController({
    required this.getPeoplesUseCase,
    required this.getPeoplesByNameUseCase,
  });

  TextEditingController textEditingController = TextEditingController();
  RxString query = ''.obs;

  final Rx<bool> _loading = true.obs;
  final RxList<PeopleEntity> _peoples = <PeopleEntity>[].obs;
  int? _nextPage = 1;

  bool get loading => _loading.value;
  List<PeopleEntity> get peoples => _peoples.toList();
  bool get initLoading => loading && peoples.isEmpty;

  final RxList<PeopleEntity> _peoplesFiltered = <PeopleEntity>[].obs;
  int? _nextPageFiltered = 1;
  final Rx<bool> _loadingFiltered = false.obs;

  List<PeopleEntity> get peoplesFiltered => _peoplesFiltered.toList();
  bool get loadingFiltered => _loadingFiltered.value;

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(infiniteScrolling);
    _initList();
    debounce(
      query,
      (_) => _queryPeoples(
        queryText: query.value,
      ),
    );
    super.onInit();
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
        !_loading.value) {
      if (query.isEmpty && _nextPage != null) {
        loadPeoples(
          page: _nextPage!,
        );
        return;
      }
      if (query.isNotEmpty && _nextPageFiltered != null) {
        searchPeoples(
          queryText: query.value,
          page: _nextPageFiltered!,
        );
        return;
      }
    }
  }

  Future<void> loadPeoples({
    int page = 1,
  }) async {
    try {
      _loading.value = true;
      final result = await getPeoplesUseCase.call(
        page: page,
      );
      _peoples.addAll(result.result);
      if (result.next != null) {
        _nextPage = page + 1;
      } else {
        _nextPage = null;
      }
      _loading.value = false;
    } catch (e) {
      print(e);
    }
  }

  Future<void> _queryPeoples({
    required String queryText,
  }) async {
    _peoplesFiltered.clear();
    if (queryText.isNotEmpty) {
      searchPeoples(
        queryText: queryText,
        page: 1,
        load: true,
      );
    }
  }

  Future<void> searchPeoples({
    required String queryText,
    int page = 1,
    bool load = false,
  }) async {
    try {
      _loadingFiltered.value = load;
      _loading.value = true;
      final result = await getPeoplesByNameUseCase.call(
        name: queryText,
        page: page,
      );
      _peoplesFiltered.addAll(result.result);
      if (result.next != null) {
        _nextPageFiltered = page + 1;
      } else {
        _nextPageFiltered = null;
      }
      _loading.value = false;
      _loadingFiltered.value = false;
    } catch (e) {
      print(e);
    }
  }
}
