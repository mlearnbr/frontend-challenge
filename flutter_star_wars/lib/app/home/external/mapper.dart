import 'package:flutter_star_wars/app/home/domain/entities/films_entity.dart';
import 'package:flutter_star_wars/app/home/domain/entities/people_entity.dart';
import 'package:flutter_star_wars/app/home/domain/entities/specie_entity.dart';

class PeopleMapper {
  static PeopleEntity fromJson(Map object) {
    return PeopleEntity(
        name: object['name'],
        birthYear: object['birth_year'],
        eyeColor: object['eye_color'],
        gender: object['gender'],
        hairColor: object['hair_color'],
        height: object['height'],
        mass: object['mass'],
        skinColor: object['skin_color'],
        homeworld: object['homeworld'],
        films: List.from(object['films']),
        species: List.from(object['species']));
  }

  static List<PeopleEntity> fromList(List list) {
    return list.map((e) => fromJson(e)).toList();
  }
}

class SpecieMapper {
  static SpecieEntity fromJson(Map object) {
    return SpecieEntity(
        name: object['name'],
        classification: object['classification'],
        designation: object['designation'],
        averageHeight: object['average_height'],
        skinColors: object['skin_colors'],
        hairColors: object['hair_colors'],
        eyeColors: object['eye_colors'],
        averageLifespan: object['average_lifespan'],
        language: object['language'],
        homeworld: object['homeworld'],
        people: object['people'],
        films: object['films']);
  }
}

class FilmMapper {
  static FilmsEntity fromJson(Map object) {
    return FilmsEntity(
        title: object['title'],
        url: object['url'],
        characters: List.from(object['characters']),
        openingCrawl: object['opening_crawl'],
        created: DateTime.parse(object['created']));
  }

  static List<FilmsEntity> fromList(List list) {
    return list.map((e) => fromJson(e)).toList();
  }
}
