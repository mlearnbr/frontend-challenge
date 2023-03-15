import 'package:challenge/Core/domain/models/planet_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../Core/errors/failures/failure.dart';

abstract class PlanetRepository {
  Future<Either<Failure, Planet>> getPlanet(String planetUrl);
}
