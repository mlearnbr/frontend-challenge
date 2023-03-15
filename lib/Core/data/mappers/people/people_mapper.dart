import 'dart:convert';

import '../../../domain/models/people_model.dart';

class PeopleMapper {
  static fromMap(Map<String, dynamic> map) {
    return People(
      map['name'] != null ? map['name'] as String : null,
      map['birth_year'] != null ? map['birth_year'] as String : null,
      map['eye_color'] != null ? map['eye_color'] as String : null,
      map['gender'] != null ? map['gender'] as String : null,
      map['hair_color'] != null ? map['hair_color'] as String : null,
      map['height'] != null ? map['height'] as String : null,
      map['mass'] != null ? map['mass'] as String : null,
      map['skin_color'] != null ? map['skin_color'] as String : null,
      map['homeworld'] != null ? map['homeworld'] as String : null,
      map['films'] != null ? List<String>.from((map['films'])) : [],
      map['species'] != null ? List<String>.from((map['species'])) : [],
    );
  }

  static fromJson(String source) =>
      fromMap(json.decode(source) as Map<String, dynamic>);
}
