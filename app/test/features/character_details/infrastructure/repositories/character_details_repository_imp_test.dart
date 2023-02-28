import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_application/features/character_details/domain/entities/film_entity.dart';
import 'package:flutter_application/features/character_details/domain/repositories/character_film_repository.dart';
import 'package:flutter_application/features/character_details/infrastructure/repositories/character_film_repository_imp.dart';
import 'package:flutter_application/features/character_list/domain/entities/specie_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_application/core/failures/failures.dart';
import 'package:flutter_application/features/character_list/domain/entities/character_entity.dart';
import 'package:flutter_application/core/network/network.dart';
import 'package:flutter_application/core/services/http/http.dart';
import '../../../../mock/character_list_mocks.dart';

class ClientSpy extends Mock implements IHttpClient {}

class NetworkSpy extends Mock implements INetworkInfo {}

class UriFake extends Fake implements Uri {}

void main() {
  late INetworkInfo networkInfo;
  late IHttpClient httpClient;
  late ICharacterFilmRepository repository;
  late String fakeUrl;
  late List<String> fakeListUrl;

  setUp(() {
    httpClient = ClientSpy();
    networkInfo = NetworkSpy();
    repository = CharacterFilmRepository(
      networkInfo: networkInfo,
      client: httpClient,
    );
    fakeUrl = faker.internet.httpsUrl();
    fakeListUrl = [fakeUrl, fakeUrl, fakeUrl];
  });

  setUpAll(() => registerFallbackValue(UriFake()));

  group('getFilmList', () {
    test('should return a list of films when the call to the API is successful',
        () async {
      when(() => httpClient.get(any())).thenAnswer((_) async =>
          HttpResponse(data: '{"title": "Some Film"}', statusCode: 200));
      when(() => networkInfo.isConnected).thenAnswer((_) async => true);
      final result = await repository.getFilmEntityList(fakeListUrl);
      expect(result, isA<Right>());
      expect(result.getOrElse(() => []), isA<List<FilmEntity>>());
    });

    test('should return a NetworkFailure when there is no network connection',
        () async {
      when(() => httpClient.get(any())).thenAnswer((_) async =>
          HttpResponse(data: '{"title": "Some Film"}', statusCode: 200));
      when(() => networkInfo.isConnected).thenAnswer((_) async => false);
      final result = await repository.getFilmEntityList(fakeListUrl);
      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => []), isA<NetworkFailure>());
    });

    test('should return a InputFailure when theres a HTTP notFound error',
        () async {
      when(() => httpClient.get(any())).thenThrow(HttpError.notFound);
      when(() => networkInfo.isConnected).thenAnswer((_) async => true);
      final result = await repository.getFilmEntityList(fakeListUrl);
      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => []), isA<InputFailure>());
    });
  });
}
