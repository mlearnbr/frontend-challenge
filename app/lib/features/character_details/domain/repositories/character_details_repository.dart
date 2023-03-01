import 'package:dartz/dartz.dart';
import 'package:flutter_application/core/failures/failures.dart';

import '../entities/entities.dart';

abstract class ICharacterDetailsRepository {
  Future<Either<Failure, List<FilmEntity>>> getFilmEntityList(List<String> url);
  Future<Either<Failure, PlanetEntity>> getCharacterPlanet(String url);
}
