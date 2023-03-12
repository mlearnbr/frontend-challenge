import 'package:dartz/dartz.dart';

import '../entities/films_entity.dart';
import '../errors/errors.dart';
import '../repositiories/get_films_repository.dart';

abstract class IGetFilmsUsecase {
  Future<Either<GetFilmsException, List<FilmsEntity>>> call();
}

class GetFilmsUsecase implements IGetFilmsUsecase {
  final GetFilmsRepository repository;

  GetFilmsUsecase(this.repository);
  @override
  Future<Either<GetFilmsException, List<FilmsEntity>>> call() async {
    return await repository.getFilms();
  }
}