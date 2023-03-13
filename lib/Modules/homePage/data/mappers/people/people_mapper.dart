import 'dart:convert';

import '../../../domain/models/film_model.dart';
import '../../../domain/models/people_model.dart';
import '../../../domain/models/specie_model.dart';
import '../film/film_mapper.dart';
import '../specie/specie_mapper.dart';

class PeopleMapper {
  static Map<String, dynamic> toMap(People people) {
    return <String, dynamic>{
      'name': people.name,
      'birthYear': people.birthYear,
      'eyeColor': people.eyeColor,
      'gender': people.gender,
      'hairColor': people.hairColor,
      'height': people.height,
      'mass': people.mass,
      'skinColor': people.skinColor,
      'homeworld': people.homeworld,
      'films': people.films.map((x) => FilmMapper.toMap(x)).toList(),
      'species': people.species.map((x) => SpecieMapper.toMap(x)).toList(),
    };
  }

  static fromMap(Map<String, dynamic> map) {
    return People(
      map['name'] as String,
      map['birthYear'] as String,
      map['eyeColor'] as String,
      map['gender'] as String,
      map['hairColor'] as String,
      map['height'] as String,
      map['mass'] as String,
      map['skinColor'] as String,
      map['homeworld'] as String,
      List<Film>.from(
        (map['films'] as List<int>).map<Film>(
          (film) => FilmMapper.fromMap(film as Map<String, dynamic>),
        ),
      ),
      List<Specie>.from(
        (map['species'] as List<int>).map<Specie>(
          (specie) => SpecieMapper.fromMap(specie as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson(People people) => json.encode(toMap(people));

  static fromJson(String source) =>
      fromMap(json.decode(source) as Map<String, dynamic>);
}
