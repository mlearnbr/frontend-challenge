// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details_controller_imp.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterDetailsController on CharacterDetailsControllerBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'CharacterDetailsControllerBase.isLoading'))
          .value;

  late final _$filmListAtom =
      Atom(name: 'CharacterDetailsControllerBase.filmList', context: context);

  @override
  List<FilmEntity> get filmList {
    _$filmListAtom.reportRead();
    return super.filmList;
  }

  @override
  set filmList(List<FilmEntity> value) {
    _$filmListAtom.reportWrite(value, super.filmList, () {
      super.filmList = value;
    });
  }

  late final _$characterPlanetAtom = Atom(
      name: 'CharacterDetailsControllerBase.characterPlanet', context: context);

  @override
  PlanetEntity? get characterPlanet {
    _$characterPlanetAtom.reportRead();
    return super.characterPlanet;
  }

  @override
  set characterPlanet(PlanetEntity? value) {
    _$characterPlanetAtom.reportWrite(value, super.characterPlanet, () {
      super.characterPlanet = value;
    });
  }

  late final _$viewStateAtom =
      Atom(name: 'CharacterDetailsControllerBase.viewState', context: context);

  @override
  AsyncStates get viewState {
    _$viewStateAtom.reportRead();
    return super.viewState;
  }

  @override
  set viewState(AsyncStates value) {
    _$viewStateAtom.reportWrite(value, super.viewState, () {
      super.viewState = value;
    });
  }

  late final _$isLoadingMoreAtom = Atom(
      name: 'CharacterDetailsControllerBase.isLoadingMore', context: context);

  @override
  bool get isLoadingMore {
    _$isLoadingMoreAtom.reportRead();
    return super.isLoadingMore;
  }

  @override
  set isLoadingMore(bool value) {
    _$isLoadingMoreAtom.reportWrite(value, super.isLoadingMore, () {
      super.isLoadingMore = value;
    });
  }

  late final _$getCharacterFilmListAsyncAction = AsyncAction(
      'CharacterDetailsControllerBase.getCharacterFilmList',
      context: context);

  @override
  Future<void> getCharacterFilmList(List<String> urls) {
    return _$getCharacterFilmListAsyncAction
        .run(() => super.getCharacterFilmList(urls));
  }

  late final _$getCharacterPlanetAsyncAction = AsyncAction(
      'CharacterDetailsControllerBase.getCharacterPlanet',
      context: context);

  @override
  Future<void> getCharacterPlanet(String url) {
    return _$getCharacterPlanetAsyncAction
        .run(() => super.getCharacterPlanet(url));
  }

  late final _$CharacterDetailsControllerBaseActionController =
      ActionController(
          name: 'CharacterDetailsControllerBase', context: context);

  @override
  void _startLoading([bool? loadingMore]) {
    final _$actionInfo = _$CharacterDetailsControllerBaseActionController
        .startAction(name: 'CharacterDetailsControllerBase._startLoading');
    try {
      return super._startLoading(loadingMore);
    } finally {
      _$CharacterDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _stopLoading([bool? loadingMore]) {
    final _$actionInfo = _$CharacterDetailsControllerBaseActionController
        .startAction(name: 'CharacterDetailsControllerBase._stopLoading');
    try {
      return super._stopLoading(loadingMore);
    } finally {
      _$CharacterDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filmList: ${filmList},
characterPlanet: ${characterPlanet},
viewState: ${viewState},
isLoadingMore: ${isLoadingMore},
isLoading: ${isLoading}
    ''';
  }
}
