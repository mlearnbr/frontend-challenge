import 'dart:convert';
import 'dart:ffi';

class PersonModel {
  String name;
  String birthYear;
  String eyeColor;
  String gender;
  String hairColor;
  String height;
  String mass;
  String skinColor;
  String homeworld;
  List films;
  List species;
  List starships;
  List vehicles;
  String url;
  String created;
  String edited;
  PersonModel({
    required this.name,
    required this.birthYear,
    required this.eyeColor,
    required this.gender,
    required this.hairColor,
    required this.height,
    required this.mass,
    required this.skinColor,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.starships,
    required this.vehicles,
    required this.url,
    required this.created,
    required this.edited,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'birthYear': birthYear,
      'eyeColor': eyeColor,
      'gender': gender,
      'hairColor': hairColor,
      'height': height,
      'mass': mass,
      'skinColor': skinColor,
      'homeworld': homeworld,
      'films': films.toList(),
      'species': species.toList(),
      'starships': starships.toList(),
      'vehicles': vehicles.toList(),
      'url': url,
      'created': created,
      'edited': edited,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      name: map['name'] ?? '',
      birthYear: map['birth_year'] ?? '',
      eyeColor: map['eye_color'] ?? '',
      gender: map['gender'] ?? '',
      hairColor: map['hair_color'] ?? '',
      height: map['height'] ?? '',
      mass: map['mass'] ?? '',
      skinColor: map['skin_color'] ?? '',
      homeworld: map['homeworld'] ?? '',
      films: List.from(map['films']),
      species: List.from(map['species']),
      starships: List.from(map['starships']),
      vehicles: List.from(map['vehicles']),
      url: map['url'] ?? '',
      created: map['created'] ?? '',
      edited: map['edited'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonModel.fromJson(String source) =>
      PersonModel.fromMap(json.decode(source));
}
