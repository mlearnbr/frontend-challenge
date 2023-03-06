// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$charactersAtom =
      Atom(name: '_HomeStoreBase.characters', context: context);

  @override
  ObservableList<CharacterModel> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<CharacterModel> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$charactersListAsyncAction =
      AsyncAction('_HomeStoreBase.charactersList', context: context);

  @override
  Future<void> charactersList() {
    return _$charactersListAsyncAction.run(() => super.charactersList());
  }

  @override
  String toString() {
    return '''
characters: ${characters}
    ''';
  }
}
