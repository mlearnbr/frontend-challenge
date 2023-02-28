import 'film_entity.dart';
import 'specie_entity.dart';

class PeopleEntity {
  final String name;
  final String birthYear;
  final String eyeColor;
  final String gender;
  final String hairColor;
  final String height;
  final String mass;
  final String skinColor;
  final String homeworld;
  List<FilmEntity> films;
  List<SpecieEntity> species;

  PeopleEntity({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    this.films = const [],
    this.species = const [],
  });
}
