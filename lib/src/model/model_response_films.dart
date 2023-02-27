import 'dart:convert';

ResponseModelFilms responseModelFilmsFromJson(String str) =>
    ResponseModelFilms.fromJson(json.decode(str));
ResultFilms responseModelFilmsFilterFromJson(String str) =>
    ResultFilms.fromJson(json.decode(str));
class ResponseModelFilms {
  ResponseModelFilms({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<ResultFilms> results;

  factory ResponseModelFilms.fromJson(Map<String, dynamic> json) =>
      ResponseModelFilms(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<ResultFilms>.from(
            json["results"].map((x) => ResultFilms.fromJson(x))),
      );
}

class ResultFilms {
  ResultFilms({
    required this.title,
    required this.characters,
  });

  String title;
  String? thumbnail;

  List<String> characters;

  factory ResultFilms.fromJson(Map<String, dynamic> json) => ResultFilms(
        title: json["title"],
        characters: List<String>.from(json["characters"].map((x) => x)),
      );
}

class CharactersModel {
  String character;
  CharactersModel({
    required this.character,
  });

  static CharactersModel? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;
    try {
      return CharactersModel(
        character: map['character'],
      );
    } catch (e) {
      return null;
    }
  }

  static CharactersModel? fromJson(String source) =>
      CharactersModel.fromMap(json.decode(source));
}
