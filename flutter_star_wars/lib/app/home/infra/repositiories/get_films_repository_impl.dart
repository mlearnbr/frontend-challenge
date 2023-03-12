import 'package:dartz/dartz.dart';

import '../../domain/entities/films_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositiories/get_films_repository.dart';
import '../datasources/get_films_datasource.dart';

class GetFilmsRepositoryImpl implements GetFilmsRepository {
  final GetFilmsDatasource datasource;

  GetFilmsRepositoryImpl(this.datasource);
  @override
  Future<Either<GetFilmsException, List<FilmsEntity>>>
      getFilms() async {
    try {
      return Right(await datasource.getFilms());
    } on GetFilmsException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GetFilmsException(e.toString()));
    }
  }
}