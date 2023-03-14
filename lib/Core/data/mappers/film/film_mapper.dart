import 'dart:convert';

import '../../../domain/models/film_model.dart';

class FilmMapper {
  static fromMap(Map<String, dynamic> map) {
    return Film(
      map['title'] as String,
      map['episodeId'] ?? 0,
    );
  }

  static fromJson(String source) =>
      FilmMapper.fromMap(json.decode(source) as Map<String, dynamic>);
}
