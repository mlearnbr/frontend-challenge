import 'package:flutter_application/core/failures/show_snackbar_failure.dart';
import 'package:flutter_application/features/character_details/domain/controllers/character_details_controller.dart';
import 'package:flutter_application/features/character_details/domain/repositories/character_details_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_application/core/constants/async_states.dart';

import '../../domain/entities/entities.dart';

part 'character_details_controller_imp.g.dart';

@Injectable(as: ICharacterDetailsController)
class CharacterDetailsController = CharacterDetailsControllerBase
    with _$CharacterDetailsController;

abstract class CharacterDetailsControllerBase
    with Store
    implements ICharacterDetailsController {
  final ICharacterDetailsRepository _characterDetailsRepository;
  CharacterDetailsControllerBase(this._characterDetailsRepository);

  @override
  @observable
  List<CharacterFilmEntity> filmList = [];

  @override
  @observable
  CharacterPlanetEntity? characterPlanet;

  @observable
  AsyncStates viewState = AsyncStates.initial;

  @override
  @computed
  bool get isLoading => viewState == AsyncStates.loading;

  @override
  @observable
  bool isLoadingMore = false;

  @action
  void _startLoading([bool? loadingMore]) => loadingMore ?? false
      ? isLoadingMore = true
      : viewState = AsyncStates.loading;

  @action
  void _stopLoading([bool? loadingMore]) => loadingMore ?? false
      ? isLoadingMore = false
      : viewState = AsyncStates.done;

  @override
  @action
  Future<void> getCharacterFilmList(List<String> urls) async {
    _startLoading();
    final result = await _characterDetailsRepository.getFilmEntityList(urls);
    result.fold(
      (l) => _showSnackbarError(),
      (r) => filmList.addAll(r),
    );
    _stopLoading();
  }

  @override
  @action
  Future<void> getCharacterPlanet(String url) async {
    _startLoading();
    final result = await _characterDetailsRepository.getCharacterPlanet(url);
    result.fold(
      (l) => _showSnackbarError(),
      (r) => characterPlanet = r,
    );
  }

  _showSnackbarError() => showSnackBarFailure(
      message:
          'Something went wrong trying to get the films please try again later!');
}
