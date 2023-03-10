// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$listCharactersAtom =
      Atom(name: '_HomeStoreBase.listCharacters', context: context);

  @override
  ObservableList<String> get listCharacters {
    _$listCharactersAtom.reportRead();
    return super.listCharacters;
  }

  @override
  set listCharacters(ObservableList<String> value) {
    _$listCharactersAtom.reportWrite(value, super.listCharacters, () {
      super.listCharacters = value;
    });
  }

  @override
  String toString() {
    return '''
listCharacters: ${listCharacters}
    ''';
  }
}
