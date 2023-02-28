// ignore_for_file: annotate_overrides, overridden_fields

import 'package:flutter_application/features/character_list/domain/entities/specie_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'specie_model.g.dart';

@JsonSerializable()
class SpecieModel extends SpecieEntity {
  @JsonKey(name: 'average_height')
  final String averageHeight;
  @JsonKey(name: 'skin_colors')
  final String skinColors;
  @JsonKey(name: 'eye_colors')
  final String eyeColors;
  @JsonKey(name: 'hair_colors')
  final String hairColors;
  @JsonKey(name: 'average_lifespan')
  final String averageLifespan;

  const SpecieModel({
    String? homeworld,
    required String name,
    required String classification,
    required String designation,
    required this.averageHeight,
    required this.skinColors,
    required this.hairColors,
    required this.eyeColors,
    required this.averageLifespan,
    required String language,
    required List<String> people,
    required List<String> films,
  }) : super(
          name: name,
          classification: classification,
          designation: designation,
          averageHeight: averageHeight,
          skinColors: skinColors,
          hairColors: hairColors,
          eyeColors: eyeColors,
          averageLifespan: averageLifespan,
          homeworld: homeworld,
          language: language,
          people: people,
          films: films,
        );

  factory SpecieModel.fromJson(Map<String, dynamic> json) =>
      _$SpecieModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecieModelToJson(this);

  SpecieEntity toEntity() => SpecieEntity(
        name: name,
        classification: classification,
        designation: designation,
        averageHeight: averageHeight,
        skinColors: skinColors,
        hairColors: hairColors,
        eyeColors: eyeColors,
        averageLifespan: averageLifespan,
        language: language,
        homeworld: homeworld,
        people: people,
        films: films,
      );
}
