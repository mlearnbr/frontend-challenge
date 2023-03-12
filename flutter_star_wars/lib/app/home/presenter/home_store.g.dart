// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$listPeopleAtom =
      Atom(name: '_HomeStoreBase.listPeople', context: context);

  @override
  ObservableList<PeopleEntity> get listPeople {
    _$listPeopleAtom.reportRead();
    return super.listPeople;
  }

  @override
  set listPeople(ObservableList<PeopleEntity> value) {
    _$listPeopleAtom.reportWrite(value, super.listPeople, () {
      super.listPeople = value;
    });
  }

  late final _$listFilmsAtom =
      Atom(name: '_HomeStoreBase.listFilms', context: context);

  @override
  ObservableList<FilmsEntity> get listFilms {
    _$listFilmsAtom.reportRead();
    return super.listFilms;
  }

  @override
  set listFilms(ObservableList<FilmsEntity> value) {
    _$listFilmsAtom.reportWrite(value, super.listFilms, () {
      super.listFilms = value;
    });
  }

  late final _$characterSelectedAtom =
      Atom(name: '_HomeStoreBase.characterSelected', context: context);

  @override
  PeopleEntity? get characterSelected {
    _$characterSelectedAtom.reportRead();
    return super.characterSelected;
  }

  @override
  set characterSelected(PeopleEntity? value) {
    _$characterSelectedAtom.reportWrite(value, super.characterSelected, () {
      super.characterSelected = value;
    });
  }

  late final _$filmSelectedAtom =
      Atom(name: '_HomeStoreBase.filmSelected', context: context);

  @override
  FilmsEntity? get filmSelected {
    _$filmSelectedAtom.reportRead();
    return super.filmSelected;
  }

  @override
  set filmSelected(FilmsEntity? value) {
    _$filmSelectedAtom.reportWrite(value, super.filmSelected, () {
      super.filmSelected = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$tabBarSelectedAtom =
      Atom(name: '_HomeStoreBase.tabBarSelected', context: context);

  @override
  String get tabBarSelected {
    _$tabBarSelectedAtom.reportRead();
    return super.tabBarSelected;
  }

  @override
  set tabBarSelected(String value) {
    _$tabBarSelectedAtom.reportWrite(value, super.tabBarSelected, () {
      super.tabBarSelected = value;
    });
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTabBar(String tabBar) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.changeTabBar');
    try {
      return super.changeTabBar(tabBar);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listPeople: ${listPeople},
listFilms: ${listFilms},
characterSelected: ${characterSelected},
filmSelected: ${filmSelected},
isLoading: ${isLoading},
tabBarSelected: ${tabBarSelected}
    ''';
  }
}
