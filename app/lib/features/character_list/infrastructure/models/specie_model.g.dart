// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecieModel _$SpecieModelFromJson(Map<String, dynamic> json) => SpecieModel(
      homeworld: json['homeworld'] as String?,
      name: json['name'] as String,
      classification: json['classification'] as String,
      designation: json['designation'] as String,
      averageHeight: json['average_height'] as String,
      skinColors: json['skin_colors'] as String,
      hairColors: json['hair_colors'] as String,
      eyeColors: json['eye_colors'] as String,
      averageLifespan: json['average_lifespan'] as String,
      language: json['language'] as String,
      people:
          (json['people'] as List<dynamic>).map((e) => e as String).toList(),
      films: (json['films'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SpecieModelToJson(SpecieModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'classification': instance.classification,
      'designation': instance.designation,
      'homeworld': instance.homeworld,
      'language': instance.language,
      'people': instance.people,
      'films': instance.films,
      'average_height': instance.averageHeight,
      'skin_colors': instance.skinColors,
      'eye_colors': instance.eyeColors,
      'hair_colors': instance.hairColors,
      'average_lifespan': instance.averageLifespan,
    };
