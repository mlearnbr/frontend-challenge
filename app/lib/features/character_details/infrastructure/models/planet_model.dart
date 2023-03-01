import 'package:flutter_application/features/character_details/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'planet_model.g.dart';

@JsonSerializable()
class PlanetModel extends PlanetEntity {
  const PlanetModel({
    required String name,
  }) : super(name: name);

  factory PlanetModel.fromJson(Map<String, dynamic> json) =>
      _$PlanetModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlanetModelToJson(this);

  PlanetEntity toEntity() => PlanetEntity(name: name);
}
