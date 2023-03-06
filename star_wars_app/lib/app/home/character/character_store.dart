// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:star_wars_app/data/use_cases/character/get_character.dart';
import 'package:star_wars_app/dir/dir.dart';
import 'package:star_wars_app/domain/entities/character_model.dart';

part 'character_store.g.dart';

class CharacterStore = _CharacterStoreBase with _$CharacterStore;

abstract class _CharacterStoreBase with Store {
  final Map<String, dynamic> data;
  late String uid;
  late String url;

  final getCharacter = getIt.get<GetCharacter>();

  _CharacterStoreBase(this.uid, this.data) {
    url = data["url"];
  }

  @observable
  late ObservableFuture<CharacterModel?> character =
      getCharacter.getCharacter(url: url).asObservable();
}
