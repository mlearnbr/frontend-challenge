import 'package:swapi_app/src/domain/entities/movie_entity.dart';

class MovieDto extends MovieEntity {
  MovieDto(
      {required String title,
      required int episodeId,
      required String openingCrawl,
      required String director,
      required String producer,
      required String releaseDate,
      required String url})
      : super(
          title: title,
          director: director,
          episodeId: episodeId,
          openingCrawl: openingCrawl,
          producer: producer,
          releaseDate: releaseDate,
          url: url,
        );

  factory MovieDto.fromMap(Map<String, dynamic> map) => MovieDto(
        title: map['title'],
        episodeId: map['episode_id'],
        openingCrawl: map['opening_crawl'],
        director: map['director'],
        producer: map['producer'],
        releaseDate: map['release_date'],
        url: map['url'],
      );
}
