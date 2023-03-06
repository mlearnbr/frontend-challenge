import 'package:star_wars_app/domain/entities/character_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'people_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PeopleModel {
  int? count;
  String? next;
  String? previous;
  List<CharacterModel>? results;

  PeopleModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  PeopleModel fromJson(Map<String, dynamic> json) => _$PeopleModelFromJson(json);

  factory PeopleModel.fromJson(Map<String, dynamic> json) => _$PeopleModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleModelToJson(this);
}
