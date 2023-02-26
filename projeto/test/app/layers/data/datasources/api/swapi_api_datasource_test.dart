import 'package:star_wars_app/app/layers/data/datasources/api/swapi_api_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('swapi api datasource: should get all Star Wars persons', () async {
    final api = SwapiApiDatasource();
    var result = await api.getAllPersons();

    expect(result, isNotNull);
    expect(result.object, isA<List<Map<String, dynamic>>>());
  });

  test('swapi api datasource: should get person using index person', () async {
    final api = SwapiApiDatasource();
    var result = await api.getPerson('/');

    expect(result, isNotNull);
    expect(result.object, isA<Map<String, dynamic>>());
  });

  test(
      'swapi api datasource: should get list persons fitered by films using index film',
      () async {
    final api = SwapiApiDatasource();
    var result = await api.getPersonsFilmFilter('2/');

    expect(result, isNotNull);
//    print(result.object);
    expect(result.object, isA<List<Map<String, dynamic>>>());
  });
}
