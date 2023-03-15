import 'package:challenge/Core/errors/failures/specie/specie_failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../../Core/domain/models/specie_model.dart';
import '../../../../../Core/errors/exceptions/base_exceptions.dart';
import '../../../../../Core/errors/failures/failure.dart';
import '../../../domain/repositories/specie/specie_repository.dart';
import '../../remote_datasource/specie/specie_remote_datasource.dart';

class SpecieRepositoryImplementation implements SpecieRepository {
  final SpecieRemoteDatasource remoteDatasource;
  SpecieRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Specie>>> getSpecies(
      List<String> specieUrl) async {
    if (specieUrl.isEmpty) {
      return left(NoSpeciesFoundFailure());
    }
    try {
      final result = await remoteDatasource.getSpecies(specieUrl);
      return right(result);
    } on CacheException {
      return left(CacheFailure());
    }
  }
}
