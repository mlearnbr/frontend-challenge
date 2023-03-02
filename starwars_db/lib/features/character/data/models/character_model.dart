import 'package:starwars_db/features/character/domain/entities/character.dart';

class CharacterModel extends Character {
  const CharacterModel({
    required super.name,
    required super.birthYear,
    required super.eyeColor,
    required super.gender,
    required super.hairColor,
    required super.height,
    required super.mass,
    required super.skinColor,
    required super.homeWorldUrl,
    required super.filmsUrls,
    required super.speciesUrls,
    required super.imagePath,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'],
      birthYear: json['birth_year'],
      eyeColor: json['eye_color'],
      gender: json['gender'],
      hairColor: json['hair_color'],
      height: json['height'],
      mass: json['mass'],
      skinColor: json['skin_color'],
      homeWorldUrl: json['homeworld'],
      filmsUrls: json['films'].cast<String>(),
      speciesUrls: json['species'].cast<String>(),
      imagePath: json['url']
          .replaceAll("https://swapi.dev/api/people/", "")
          .replaceAll("/", ".jpg"),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'birthYear': birthYear,
      'eyeColor': eyeColor,
      'gender': gender,
      'hairColor': hairColor,
      'height': height,
      'mass': mass,
      'skinColor': skinColor,
      'homeWorldUrl': homeWorldUrl,
      'filmsUrls': filmsUrls,
      'speciesUrls': speciesUrls,
      'imagePath': imagePath,
    };
  }
}
