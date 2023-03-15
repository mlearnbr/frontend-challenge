import 'package:challenge/Core/errors/failures/homeworld/planet_failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../../Core/domain/models/planet_model.dart';
import '../../../../../Core/errors/exceptions/base_exceptions.dart';
import '../../../../../Core/errors/failures/failure.dart';

import '../../../domain/repositories/planet/planet_repository.dart';
import '../../remote_datasource/homeworld/planet_remote_datasource.dart';

class PlanetRepositoryImplementation implements PlanetRepository {
  final PlanetRemoteDatasource remoteDatasource;
  PlanetRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, Planet>> getPlanet(String planetUrl) async {
    if (planetUrl.isEmpty) {
      return left(NoPlanetFoundFailure());
    }
    try {
      final result = await remoteDatasource.getPlanet(planetUrl);
      return right(result);
    } on CacheException {
      return left(CacheFailure());
    }
  }
}
