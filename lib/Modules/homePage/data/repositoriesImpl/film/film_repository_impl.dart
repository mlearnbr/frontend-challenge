import 'package:dartz/dartz.dart';

import '../../../../../Core/errors/exceptions/base_exceptions.dart';
import '../../../../../Core/errors/failures/failure.dart';
import '../../../../../Core/domain/models/film_model.dart';

import '../../../../../Core/errors/failures/film/film_failure.dart';
import '../../../domain/repositories/film/film_repository.dart';
import '../../remote_datasource/film/film_remote_datasource.dart';

class FilmRepositoryImplementation implements FilmRepository {
  final FilmRemoteDatasource remoteDatasource;
  FilmRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Film>>> getFilms(List<String> filmUrl) async {
    if (filmUrl.isEmpty || filmUrl == []) {
      return left(NoFilmsFoundFailure());
    }
    try {
      final result = await remoteDatasource.getFilms(filmUrl);
      return right(result);
    } on CacheException {
      return left(CacheFailure());
    }
  }
}
