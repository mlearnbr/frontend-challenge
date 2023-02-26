import 'package:flutter_test/flutter_test.dart';
import 'package:star_wars_app/app/layers/data/datasources/api/swapi_api_datasource.dart';
import 'package:star_wars_app/app/layers/data/repositories/persons_repository.dart';
import 'package:star_wars_app/app/layers/domain/states/persons_states_model.dart';
import 'package:star_wars_app/app/layers/presenters/controllers/persons_controller.dart';

void main() {
  test('persons controller: should loading the home list with success',
      () async {
    final controller =
        PersonsController(PersonsRepository(SwapiApiDatasource()));

    await controller.loadingListHome();

    expect(controller.personsState.value, isA<PersonsSuccessState>());
  });

  test(
      'persons controller: should be get species name using specie url, with success',
      () async {
    final controller =
        PersonsController(PersonsRepository(SwapiApiDatasource()));

    var specieUrlTest = 'https://swapi.dev/api/species/3';

    var result = await controller.getSpecie(specieUrlTest);

    expect(result, isA<String>());
    expect(result, 'Wookie');
  });
}
