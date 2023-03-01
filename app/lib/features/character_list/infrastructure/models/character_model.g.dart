// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      species: (json['species'] as List<dynamic>?)
          ?.map((e) => SpecieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      birthYear: json['birth_year'] as String,
      eyeColor: json['eye_color'] as String,
      gender: json['gender'] as String,
      hairColor: json['hair_color'] as String,
      height: json['height'] as String,
      mass: json['mass'] as String,
      skinColor: json['skin_color'] as String,
      homeworld: json['homeworld'] as String,
      films: (json['films'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'height': instance.height,
      'mass': instance.mass,
      'homeworld': instance.homeworld,
      'films': instance.films,
      'species': instance.species,
      'birth_year': instance.birthYear,
      'eye_color': instance.eyeColor,
      'hair_color': instance.hairColor,
      'skin_color': instance.skinColor,
    };
