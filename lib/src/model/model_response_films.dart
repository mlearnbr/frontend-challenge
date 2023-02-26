import 'dart:convert';

ResponseModelFilme responseModelFilmeFromJson(String str) =>
    ResponseModelFilme.fromJson(json.decode(str));

class ResponseModelFilme {
  ResponseModelFilme({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<ResultFilme> results;

  factory ResponseModelFilme.fromJson(Map<String, dynamic> json) =>
      ResponseModelFilme(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<ResultFilme>.from(
            json["results"].map((x) => ResultFilme.fromJson(x))),
      );
}

class ResultFilme {
  ResultFilme({
    required this.title,
    required this.characters,
  });

  String title;

  List<String> characters;

  factory ResultFilme.fromJson(Map<String, dynamic> json) => ResultFilme(
        title: json["title"],
        characters: List<String>.from(json["characters"].map((x) => x)),
      );
}
