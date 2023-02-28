import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:faker/faker.dart';

import 'package:flutter_application/features/character_details/application/controllers/character_details_controller_imp.dart';
import 'package:flutter_application/features/character_details/domain/controllers/character_details_controller.dart';
import 'package:flutter_application/features/character_details/domain/entities/film_entity.dart';
import 'package:flutter_application/features/character_details/domain/repositories/character_film_repository.dart';
import 'package:flutter_application/core/failures/failure.dart';

import '../../../../mock/character_list_mocks.dart';

class RepositorySpy extends Mock implements ICharacterFilmRepository {
  @override
  Future<Either<Failure, List<FilmEntity>>> getFilmEntityList(
      List<String> url) async {
    return const Right(filmListMock);
  }
}

void main() {
  late ICharacterDetailsController controller;
  late ICharacterFilmRepository repository;
  late String fakeUrl;
  late List<String> fakeListUrl;

  setUp(() {
    repository = RepositorySpy();
    controller = CharacterDetailsController(repository);
    fakeUrl = faker.internet.httpsUrl();
    fakeListUrl = [fakeUrl, fakeUrl, fakeUrl];
  });

  group('Initial States', () {
    test('filmList should be empty at the beginning', () {
      expect(controller.filmList.isEmpty, true);
    });
    test('isLoading should be false at the beginning', () {
      expect(controller.isLoading, false);
    });
    test('isLoadingMore should be false at the beginning', () {
      expect(controller.isLoadingMore, false);
    });
  });

  group('getFilmList', () {
    test('getFilmList should add films to the filmList', () async {
      await controller.getCharacterFilmList(fakeListUrl);
      expect(controller.filmList, filmListMock);
    });
  });
}
