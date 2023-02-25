import 'package:star_wars_app/app/layers/data/datasources/api/swapi_api_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('swapi api datasource: should get all Star Wars persons', () async {
    final api = SwapiApiDatasource();
    var result = await api.getAllPersons();

    expect(result, isNotNull);
    expect(result.object, isA<List<Map<String, dynamic>>>());
  });
}
