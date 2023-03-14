import 'package:dartz/dartz.dart';

import '../../../../../Core/domain/models/specie_model.dart';
import '../../../../../Core/errors/exceptions/base_exceptions.dart';
import '../../../../../Core/errors/failures/failure.dart';
import '../../../domain/repositories/specie_repository.dart';
import '../../remote_datasource/specie/specie_remote_datasource.dart';

class SpecieRepositoryImplementation implements SpecieRepository {
  final SpecieRemoteDatasource remoteDatasource;
  SpecieRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, Specie>> getSpecie(String specieUrl) async {
    try {
      final result = await remoteDatasource.getSpecie(specieUrl);
      return right(result);
    } on CacheException {
      return left(CacheFailure());
    }
  }
}
