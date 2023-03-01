import 'package:dartz/dartz.dart';
import 'package:flutter_application/core/failures/failures.dart';

import '../entities/entities.dart';

abstract class ICharacterDetailsRepository {
  Future<Either<Failure, List<CharacterFilmEntity>>> getFilmEntityList(
      List<String> url);
  Future<Either<Failure, CharacterPlanetEntity>> getCharacterPlanet(String url);
}
