import 'package:flutter_application/features/character_details/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_planet_model.g.dart';

@JsonSerializable()
class CharacterPlanetModel extends CharacterPlanetEntity {
  const CharacterPlanetModel({
    required String name,
  }) : super(name: name);

  factory CharacterPlanetModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterPlanetModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterPlanetModelToJson(this);

  CharacterPlanetEntity toEntity() => CharacterPlanetEntity(name: name);
}
