import '../../infra/models/film_model.dart';

class FelmModelMapper {
  FilmModel fromJson(Map<String, dynamic> json) {
    return FilmModel(
      title: json['title'] ?? '',
      episodeId: json['episode_id'] ?? '',
      openingCrawl: json['opening_crawl'] ?? '',
      director: json['director'] ?? '',
      producer: json['producer'] ?? '',
    );
  }
}
