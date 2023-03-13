import 'dart:convert';

import '../../../domain/models/film_model.dart';

class FilmMapper {
  static Map<String, dynamic> toMap(Film film) {
    return <String, dynamic>{
      'title': film.title,
      'episodeId': film.episodeId,
    };
  }

  static fromMap(Map<String, dynamic> map) {
    return Film(
      map['title'] as String,
      map['episodeId'] as int,
    );
  }

  static String toJson(Film film) => json.encode(toMap(film));

  static fromJson(String source) =>
      FilmMapper.fromMap(json.decode(source) as Map<String, dynamic>);
}
