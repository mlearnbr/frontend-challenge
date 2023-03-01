import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_application/core/failures/failure.dart';
import 'package:flutter_application/features/character_list/application/character_list/character_list_controller_imp.dart';
import 'package:flutter_application/features/character_list/domain/controllers/character_list_controller.dart';
import 'package:flutter_application/features/character_list/domain/entities/character_entity.dart';
import 'package:flutter_application/features/character_list/domain/repositories/character_list_repository.dart';

import '../../../../mock/character_list_mocks.dart';

class RepositorySpy extends Mock implements ICharacterListRepository {
  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharacterList(
      {int? page = 1}) async {
    return const Right(characterListMock);
  }
}

void main() {
  late ICharacterListController controller;
  late ICharacterListRepository repository;

  setUp(() {
    repository = RepositorySpy();
    controller = CharacterListController(repository);
  });

  group('Initial States', () {
    test('characterList should be empty at the beginning', () {
      expect(controller.characterList.isEmpty, true);
    });
    test('isLoading should be false at the beginning', () {
      expect(controller.isLoading, false);
    });
    test('isLoadingMore should be false at the beginning', () {
      expect(controller.isLoadingMore, false);
    });
  });

  group('getCharacterList', () {
    test('getCharacterList should add characters to the characterList',
        () async {
      await controller.getCharacterList(loadingMore: false);
      expect(controller.characterList, characterListMock);
    });
  });
}
