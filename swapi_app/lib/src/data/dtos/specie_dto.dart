import 'package:swapi_app/src/domain/entities/specie_entity.dart';

class SpecieDto extends SpecieEntity {
  SpecieDto({
    required String name,
    required String classification,
    required String designation,
    String? averageHeight,
    String? skinColors,
    String? hairColors,
    String? eyeColors,
    String? averageLifespan,
    String? homeworld,
    String? language,
    required String url,
  }) : super(
          name: name,
          classification: classification,
          designation: designation,
          averageHeight: averageHeight,
          skinColors: skinColors,
          hairColors: hairColors,
          eyeColors: eyeColors,
          averageLifespan: averageHeight,
          homeworld: homeworld,
          language: language,
          url: url,
        );

  factory SpecieDto.fromMap(Map<String, dynamic> map) => SpecieDto(
        name: map['name'],
        classification: map['classification'],
        designation: map['designation'],
        averageHeight:
            map['average_height'] == null || map['average_height'] == 'n/a'
                ? null
                : map['average_height'],
        skinColors: map['skin_colors'] == null || map['skin_colors'] == 'n/a'
            ? null
            : map['skin_colors'],
        hairColors: map['hair_colors'] == null || map['hair_colors'] == 'n/a'
            ? null
            : map['hair_colors'],
        eyeColors: map['eye_colors'] == null || map['eye_colors'] == 'n/a'
            ? null
            : map['eye_colors'],
        averageLifespan:
            map['average_lifespan'] == null || map['average_lifespan'] == 'n/a'
                ? null
                : map['average_lifespan'],
        homeworld: map['homeworld'],
        language: map['language'] == null || map['language'] == 'n/a'
            ? null
            : map['language'],
        url: map['url'],
      );
}
