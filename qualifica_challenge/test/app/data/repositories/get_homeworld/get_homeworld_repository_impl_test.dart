import 'package:flutter_test/flutter_test.dart';
import 'package:qualifica_challenge/app/data/models/homeworld_model.dart';
import 'package:qualifica_challenge/app/data/repositories/get_homeworld/get_homeworld_repository.dart';

var homeworld = HomeworldModel(name: 'Tatooine');

class GetHomeworldRepositoryImpl implements GetHomeworldRepository {
  @override
  Future<HomeworldModel> getHomeworldRepository(String url) async {
    return homeworld;
  }
}

main() {
  GetHomeworldRepository repository = GetHomeworldRepositoryImpl();

  test("O teste deve retornar um model de homeworld no repository.", () async {
    final result = await repository.getHomeworldRepository('');

    expect(result, isA<HomeworldModel>());
  });
}
