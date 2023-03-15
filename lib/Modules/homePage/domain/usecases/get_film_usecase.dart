import 'package:dartz/dartz.dart';

import '../../../../Core/domain/models/film_model.dart';
import '../../../../Core/errors/failures/failure.dart';
import '../repositories/film/film_repository.dart';

class GetFilmUseCase {
  final FilmRepository filmRepository;

  GetFilmUseCase({
    required this.filmRepository,
  });

  Future<Either<Failure, List<Film>>> call(List<String> filmUrl) async {
    return await filmRepository.getFilms(filmUrl);
  }
}
