// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'character_store.g.dart';

class CharacterStore = _CharacterStoreBase with _$CharacterStore;

abstract class _CharacterStoreBase with Store {
  late String uid;

  _CharacterStoreBase(this.uid);
}
