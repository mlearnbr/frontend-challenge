import 'package:dartz/dartz.dart';
import 'package:flutter_application/core/failures/failures.dart';

import '../entities/film_entity.dart';

abstract class ICharacterFilmRepository {
  Future<Either<Failure, List<FilmEntity>>> getFilmEntityList(List<String> url);
}
