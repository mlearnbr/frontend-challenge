import 'package:flutter_application/app/layers/data/datasources/api/swapi_api_datasource.dart';
import 'package:flutter_application/app/layers/data/repositories/persons_repository.dart';
import 'package:flutter_application/app/layers/domain/models/persons_states_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('persons repository: should return a type of PersonsState (abstract)',
      () async {
    final repository = PersonsRepository(SwapiApiDatasource());

    var result = await repository.getAllPersons();

    if (result is PersonsErrorState) {
      print(result.errorMessage);
    } else {
      print('Lista obtida com sucesso');
    }

    expect(result, isA<PersonsState>());
  });

  test(
      'persons repository: should return a PersonsSuccessState with the list of persons',
      () async {
    final repository = PersonsRepository(SwapiApiDatasource());

    var result = await repository.getAllPersons();

    if (result is PersonsErrorState) {
      print(result.errorMessage);
    } else {
      print('Lista obtida com sucesso');
    }

    expect(result, isA<PersonsSuccessState>());
  });
}
