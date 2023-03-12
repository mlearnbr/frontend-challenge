import 'package:dartz/dartz.dart';
import 'package:flutter_star_wars/app/home/domain/entities/films_entity.dart';
import 'package:flutter_star_wars/app/home/domain/usecases/get_films_usecase.dart';
import 'package:flutter_star_wars/app/home/external/http/http_get_films.dart';
import 'package:flutter_star_wars/app/home/infra/repositories/get_films_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final datasource = HttpGetFilms();
  final repository = GetFilmsRepositoryImpl(datasource);
  final usecase = GetFilmsUsecase(repository);

  test('Returns a list of movies ...', () async {
    final result = await usecase();
    expect(result.fold(id, id), isA<List<FilmsEntity>>());
  });
}