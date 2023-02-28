import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/film_entity.dart';

part 'film_model.g.dart';

@JsonSerializable()
class FilmModel extends FilmEntity {
  const FilmModel({
    required String title,
  }) : super(title: title);

  factory FilmModel.fromJson(Map<String, dynamic> json) =>
      _$FilmModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilmModelToJson(this);

  FilmEntity toEntity() => FilmEntity(title: title);
}
