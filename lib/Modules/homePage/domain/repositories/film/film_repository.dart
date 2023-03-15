import 'package:dartz/dartz.dart';

import '../../../../../Core/errors/failures/failure.dart';
import '../../../../../Core/domain/models/film_model.dart';

abstract class FilmRepository {
  Future<Either<Failure, List<Film>>> getFilms(List<String> filmUrl);
}
