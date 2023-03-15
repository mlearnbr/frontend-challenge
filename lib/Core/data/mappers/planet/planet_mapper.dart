import 'dart:convert';

import '../../../domain/models/planet_model.dart';

class PlanetMapper {
  static fromMap(Map<String, dynamic> map) {
    return Planet(
      map['name'] as String,
    );
  }

  static fromJson(String source) =>
      fromMap(json.decode(source) as Map<String, dynamic>);
}
