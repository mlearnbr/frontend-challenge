import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/character_film_entity.dart';

part 'character_film_model.g.dart';

@JsonSerializable()
class CharacterFilmModel extends CharacterFilmEntity {
  const CharacterFilmModel({
    required String title,
  }) : super(title: title);

  factory CharacterFilmModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterFilmModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterFilmModelToJson(this);

  CharacterFilmEntity toEntity() => CharacterFilmEntity(title: title);
}
