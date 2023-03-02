import 'package:swapi_app/src/domain/entities/people_entity.dart';

class PeopleDto extends PeopleEntity {
  PeopleDto({
    required String name,
    String? birthYear,
    required String heigth,
    required String mass,
    String? hairColor,
    required String skinColor,
    required String eyeColor,
    String? gender,
    required String homeworld,
    required List<String> films,
    required List<String> species,
  }) : super(
          name: name,
          heigth: heigth,
          mass: mass,
          hairColor: hairColor,
          skinColor: skinColor,
          birthYear: birthYear,
          eyeColor: eyeColor,
          gender: gender,
          homeworld: homeworld,
          films: films,
          species: species,
        );

  factory PeopleDto.fromMap(Map<String, dynamic> map) => PeopleDto(
        name: map['name'],
        birthYear: map['birth_year'] == null || map['birth_year'] == 'unknown'
            ? null
            : map['birth_year'],
        heigth: map['height'],
        mass: map['mass'],
        hairColor: map['hair_color'] == null || map['hair_color'] == 'n/a'
            ? null
            : map['hair_color'],
        eyeColor: map['eye_color'],
        skinColor: map['skin_color'],
        homeworld: map['homeworld'],
        gender: map['gender'] == null || map['gender'] == 'n/a'
            ? null
            : map['gender'],
        films: map['films'].cast<String>(),
        species: map['species'].cast<String>(),
      );
}
