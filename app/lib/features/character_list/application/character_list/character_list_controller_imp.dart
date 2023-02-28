import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_application/core/constants/async_states.dart';
import 'package:flutter_application/features/character_list/domain/controllers/character_list_controller.dart';
import 'package:flutter_application/features/character_list/domain/entities/character_entity.dart';
import 'package:flutter_application/features/character_list/domain/repositories/character_list_repository.dart';

part 'character_list_controller_imp.g.dart';

@Injectable(as: ICharacterListController)
class CharacterListController = CharacterListControllerBase
    with _$CharacterListController;

abstract class CharacterListControllerBase
    with Store
    implements ICharacterListController {
  final ICharacterListRepository _characterListRepository;
  CharacterListControllerBase(this._characterListRepository);

  @observable
  List<CharacterEntity> characterList = [];

  @observable
  AsyncStates viewState = AsyncStates.initial;

  @computed
  bool get isLoading => viewState == AsyncStates.loading;

  @action
  void _startLoading() => viewState = AsyncStates.loading;

  @action
  void _stopLoading() => viewState = AsyncStates.done;

  @override
  @action
  Future<void> getCharacterList() async {
    _startLoading();
    final result = await _characterListRepository.getCharacterList();
    result.fold(
      (l) => null,
      (r) => characterList.addAll(r),
    );
    _stopLoading();
  }
}
