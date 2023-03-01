import 'package:flutter_test/flutter_test.dart';
import 'package:qualifica_challenge/app/data/models/species_model.dart';
import 'package:qualifica_challenge/app/data/repositories/get_species/get_species_repository.dart';

var species = SpeciesModel(name: 'Human');

class GetSpeciesRepositoryImpl implements GetSpeciesRepository {
  @override
  Future<SpeciesModel> getSpeciesRepository(String url) async {
    return species;
  }
}

main() {
  GetSpeciesRepository repository = GetSpeciesRepositoryImpl();

  test("O teste deve retornar um model de species no repository.", () async {
    final result = await repository.getSpeciesRepository('');

    expect(result, isA<SpeciesModel>());
  });
}
