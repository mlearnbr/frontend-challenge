import 'package:dartz/dartz.dart';
import 'package:flutter_star_wars/app/home/domain/entities/specie_entity.dart';
import 'package:flutter_star_wars/app/home/domain/usecases/get_species_by_people_id_usecase.dart';
import 'package:flutter_star_wars/app/home/external/http/http_get_species_by_people_id.dart';
import 'package:flutter_star_wars/app/home/infra/repositories/get_species_by_people_id_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final datasource = HttpGetSpeciesByPeopleId();
  final repository = GetSpeciesByPeopleIdRepositoryImpl(datasource);
  final usecase = GetSpeciesByPeopleIdUsecase(repository);

  test('Returns the species by people id ...', () async {
    final result = await usecase("1");
    expect(result.fold(id, id), isA<SpecieEntity>());
  });
}