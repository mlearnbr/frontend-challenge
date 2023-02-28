import '../../domain/entities/film_entity.dart';
import '../models/film_model.dart';

class FilmEntityAdapter {
  FilmEntity fromModel({
    required FilmModel filmModel,
  }) {
    return FilmEntity(
      title: filmModel.title,
      episodeId: filmModel.episodeId,
      openingCrawl: filmModel.openingCrawl,
      director: filmModel.director,
      producer: filmModel.producer,
      releaseDate: filmModel.releaseDate,
    );
  }
}
