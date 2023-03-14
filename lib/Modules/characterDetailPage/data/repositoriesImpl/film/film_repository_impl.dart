import 'package:dartz/dartz.dart';

import '../../../../../Core/errors/exceptions/base_exceptions.dart';
import '../../../../../Core/errors/failures/failure.dart';
import '../../../../../Core/domain/models/film_model.dart';
import '../../../domain/repositories/film_repository.dart';
import '../../remote_datasource/film/film_remote_datasource.dart';

class FilmRepositoryImplementation implements FilmRepository {
  final FilmRemoteDatasource remoteDatasource;
  FilmRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, Film>> getFilm(String filmUrl) async {
    try {
      final result = await remoteDatasource.getFilm(filmUrl);
      return right(result);
    } on CacheException {
      return left(CacheFailure());
    }
  }
}
