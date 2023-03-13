import 'package:challenge/Modules/homePage/domain/models/film_model.dart';
import 'package:challenge/Modules/homePage/domain/models/specie_model.dart';

class People {
  final String name;
  final String birthYear;
  final String eyeColor;
  final String gender;
  final String hairColor;
  final String height;
  final String mass;
  final String skinColor;
  final String homeworld;
  final List<Film> films;
  final List<Specie> species;

  People(
      this.name,
      this.birthYear,
      this.eyeColor,
      this.gender,
      this.hairColor,
      this.height,
      this.mass,
      this.skinColor,
      this.homeworld,
      this.films,
      this.species);
}
