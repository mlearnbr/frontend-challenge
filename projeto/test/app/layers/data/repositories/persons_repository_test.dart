// ignore_for_file: avoid_print

import 'package:star_wars_app/app/layers/data/datasources/api/swapi_api_datasource.dart';
import 'package:star_wars_app/app/layers/data/repositories/persons_repository.dart';
import 'package:star_wars_app/app/layers/domain/states/persons_states_model.dart';
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

  test(
      'persons repository: should return a PersonsSuccessState with the list of persons filtered by film',
      () async {
    final repository = PersonsRepository(SwapiApiDatasource());

    var result = await repository.getPersonsFilmFilter('2/');

    if (result is PersonsErrorState) {
      print(result.errorMessage);
    } else {
      print('Lista obtida com sucesso');
    }

    expect(result, isA<PersonsSuccessState>());
  });
}
