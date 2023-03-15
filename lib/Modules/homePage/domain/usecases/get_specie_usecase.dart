import 'package:dartz/dartz.dart';

import '../../../../Core/domain/models/specie_model.dart';
import '../../../../Core/errors/failures/failure.dart';
import '../repositories/specie/specie_repository.dart';

class GetSpeciesUseCase {
  final SpecieRepository specieRepository;

  GetSpeciesUseCase({required this.specieRepository});

  Future<Either<Failure, List<Specie>>> call(List<String> specieUrl) async {
    return await specieRepository.getSpecies(specieUrl);
  }
}
