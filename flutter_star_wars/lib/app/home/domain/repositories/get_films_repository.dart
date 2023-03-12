
import 'package:dartz/dartz.dart';

import '../entities/films_entity.dart';
import '../errors/errors.dart';

abstract class GetFilmsRepository {
  Future<Either<GetFilmsException, List<FilmsEntity>>> getFilms();
}