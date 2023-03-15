import 'package:dartz/dartz.dart';

import '../../../../../Core/domain/models/specie_model.dart';
import '../../../../../Core/errors/failures/failure.dart';

abstract class SpecieRepository {
  Future<Either<Failure, List<Specie>>> getSpecies(List<String> specieUrl);
}
