// ignore_for_file: annotate_overrides, overridden_fields

import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_application/features/character_list/domain/entities/character_entity.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends CharacterEntity {
  @JsonKey(name: 'birth_year')
  final String birthYear;
  @JsonKey(name: 'eye_color')
  final String eyeColor;
  @JsonKey(name: 'hair_color')
  final String hairColor;
  @JsonKey(name: 'skin_color')
  final String skinColor;
  const CharacterModel({
    required String name,
    required this.birthYear,
    required this.eyeColor,
    required String gender,
    required this.hairColor,
    required String height,
    required String mass,
    required this.skinColor,
    required String homeworld,
    required List<String> films,
    required List<String> species,
  }) : super(
          name: name,
          birthYear: birthYear,
          eyeColor: eyeColor,
          gender: gender,
          hairColor: hairColor,
          height: height,
          mass: mass,
          skinColor: skinColor,
          homeworld: homeworld,
          films: films,
          species: species,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);

  CharacterEntity toEntity() => CharacterEntity(
        name: name,
        birthYear: birthYear,
        eyeColor: eyeColor,
        gender: gender,
        hairColor: hairColor,
        height: height,
        mass: mass,
        skinColor: skinColor,
        homeworld: homeworld,
        films: films,
        species: species,
      );
}
