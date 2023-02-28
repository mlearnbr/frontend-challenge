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

  @override
  @observable
  List<CharacterEntity> characterList = [];

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

  @observable
  int offset = 1;

  @override
  @action
  Future<void> getCharacterList({bool? loadingMore}) async {
    _startLoading(loadingMore);
    final result =
        await _characterListRepository.getCharacterList(page: offset);
    result.fold(
      (l) => null,
      (r) {
        characterList.addAll(r);
        offset++;
      },
    );
    _stopLoading(loadingMore);
  }
}
