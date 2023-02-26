// ignore_for_file: constant_identifier_names

import 'dart:convert';

ResponseModelPeople responseModelPeopleFromJson(String str) =>
    ResponseModelPeople.fromJson(json.decode(str));

ResultCharacter responseModelPeopleFilterFromJson(String str) =>
    ResultCharacter.fromJson(json.decode(str));

class ResponseModelPeople {
  ResponseModelPeople({
    required this.results,
  });

  List<ResultCharacter> results;

  factory ResponseModelPeople.fromJson(Map<String, dynamic> json) =>
      ResponseModelPeople(
        results: List<ResultCharacter>.from(
            json["results"].map((x) => ResultCharacter.fromJson(x))),
      );
}

class ResultCharacter {
  ResultCharacter(
      {required this.name,
      required this.height,
      required this.mass,
      required this.hairColor,
      required this.skinColor,
      required this.eyeColor,
      required this.birthYear,
      required this.gender,
      required this.homeworld,
      required this.films,
      required this.species,
      required this.vehicles,
      required this.starships,
      required this.created,
      required this.edited,
      required this.url,
      this.id = 1});

  String name;
  String height;
  String mass;
  String hairColor;
  String skinColor;
  String eyeColor;
  String birthYear;
  Gender? gender;
  String homeworld;
  List<String> films;
  List<String> species;
  List<String> vehicles;
  List<String> starships;
  DateTime created;
  DateTime edited;
  String url;
  int id;

  factory ResultCharacter.fromJson(Map<String, dynamic> json) =>
      ResultCharacter(
        name: json["name"],
        height: json["height"],
        mass: json["mass"],
        hairColor: json["hair_color"],
        skinColor: json["skin_color"],
        eyeColor: json["eye_color"],
        birthYear: json["birth_year"],
        gender: genderValues.map[json["gender"]],
        homeworld: json["homeworld"],
        films: List<String>.from(json["films"].map((x) => x)),
        species: List<String>.from(json["species"].map((x) => x)),
        vehicles: List<String>.from(json["vehicles"].map((x) => x)),
        starships: List<String>.from(json["starships"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
      );
}

enum Gender { MALE, N_A, FEMALE }

final genderValues = EnumValues(
    {"female": Gender.FEMALE, "male": Gender.MALE, "n/a": Gender.N_A});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
