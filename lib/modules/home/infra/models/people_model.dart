import 'film_model.dart';
import 'specie_model.dart';

class PeopleModel {
  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;
  final String homeworld;
  List<FilmModel> films;
  List<SpecieModel> species;

  PeopleModel({
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
