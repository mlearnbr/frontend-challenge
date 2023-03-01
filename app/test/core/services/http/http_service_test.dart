import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_application/core/services/http/http.dart';

class HttpSpy extends Mock implements Client {}

class UriFake extends Fake implements Uri {}

void main() {
  late Client client;
  late IHttpClient httpService;
  late String url;
  late Response response;
  late Response errorResponse;

  setUpAll(() => registerFallbackValue(UriFake()));

  setUp(() {
    client = HttpSpy();
    httpService = HttpService(client);
    url = faker.internet.httpUrl();
    response = Response('body', 200);
    errorResponse = Response('body', 404);
  });

  setUpAll(() => registerFallbackValue(UriFake()));

  group('HttpService get', () {
    test('should return an HttpResponse when calls to the client succeed',
        () async {
      when(() => client.get(any())).thenAnswer((_) async => response);
      final result = await httpService.get(url);
      expect(result, isA<HttpResponse>());
      expect(result.data, isNotNull);
      expect(result.statusCode, equals(200));
    });

    test('should throw HttpError.notFound when a 404 status code is returned',
        () async {
      when(() => client.get(any())).thenAnswer((_) async => errorResponse);
      expect(() => httpService.get(url), throwsA(HttpError.notFound));
    });
  });
}
