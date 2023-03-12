import 'package:dartz/dartz.dart';
import 'package:flutter_star_wars/app/home/domain/entities/people_entity.dart';
import 'package:flutter_star_wars/app/home/domain/usecases/get_people_usecase.dart';
import 'package:flutter_star_wars/app/home/external/http/http_get_people.dart';
import 'package:flutter_star_wars/app/home/infra/repositories/get_people_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final datasource = HttpGetPeople();
  final repository = GetPeopleRepositoryImpl(datasource);
  final usecase = GetPeopleUsecase(repository);

  test('Returns a list of people ...', () async {
    final result = await usecase();
    expect(result.fold(id, id), isA<List<PeopleEntity>>());
  });
}