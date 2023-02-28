import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_application/core/failures/failures.dart';
import 'package:flutter_application/features/character_list/domain/entities/character_entity.dart';
import 'package:flutter_application/features/character_list/domain/repositories/character_list_repository.dart';
import 'package:flutter_application/features/character_list/infrastructure/repositories/character_list_repository_imp.dart';
import 'package:flutter_application/core/network/network.dart';
import 'package:flutter_application/core/services/http/http.dart';
import '../../../../mock/character_list_mocks.dart';

class ClientSpy extends Mock implements IHttpClient {}

class NetworkSpy extends Mock implements INetworkInfo {}

class UriFake extends Fake implements Uri {}

void main() {
  late INetworkInfo networkInfo;
  late IHttpClient httpClient;
  late ICharacterListRepository repository;

  setUp(() {
    httpClient = ClientSpy();
    networkInfo = NetworkSpy();
    repository = CharacterListRepository(
      networkInfo: networkInfo,
      client: httpClient,
    );
  });

  setUpAll(() => registerFallbackValue(UriFake()));

  test(
      'should return a list of characters when the call to the API is successful',
      () async {
    when(() => httpClient.get(any())).thenAnswer(
        (_) async => HttpResponse(data: characterListJson, statusCode: 200));
    when(() => networkInfo.isConnected).thenAnswer((_) async => true);
    final result = await repository.getCharacterList();
    expect(result, isA<Right>());
    expect(result.getOrElse(() => []), isA<List<CharacterEntity>>());
  });

  test('should return a NetworkFailure when there is no network connection',
      () async {
    when(() => httpClient.get(any())).thenAnswer(
        (_) async => HttpResponse(data: characterListJson, statusCode: 200));
    when(() => networkInfo.isConnected).thenAnswer((_) async => false);
    final result = await repository.getCharacterList();
    expect(result.isLeft(), true);
    expect(result.fold((l) => l, (r) => []), isA<NetworkFailure>());
  });

  test('should return a InputFailure when theres a HTTP notFound error',
      () async {
    when(() => httpClient.get(any())).thenThrow(HttpError.notFound);
    when(() => networkInfo.isConnected).thenAnswer((_) async => true);
    final result = await repository.getCharacterList();
    expect(result.isLeft(), true);
    expect(result.fold((l) => l, (r) => []), isA<InputFailure>());
  });
}
