import 'package:challenge/Modules/homePage/domain/repositories/planet/planet_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../Core/domain/models/planet_model.dart';
import '../../../../Core/errors/failures/failure.dart';

class GetPlanetUseCase {
  final PlanetRepository planetRepository;

  GetPlanetUseCase({
    required this.planetRepository,
  });

  Future<Either<Failure, Planet>> call(String planet) async {
    return await planetRepository.getPlanet(planet);
  }
}
