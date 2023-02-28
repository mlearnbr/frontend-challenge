import 'package:flutter_application/features/character_list/domain/entities/character_entity.dart';

abstract class ICharacterListController {
  Future<void> getCharacterList({bool? loadingMore});
  bool get isLoading;
  bool get isLoadingMore;
  List<CharacterEntity> get characterList;
}
