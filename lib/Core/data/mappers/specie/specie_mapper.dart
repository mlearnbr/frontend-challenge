import 'dart:convert';

import 'package:challenge/Core/domain/models/specie_model.dart';

class SpecieMapper {
  static Map<String, dynamic> toMap(Specie specie) {
    return <String, dynamic>{
      'name': specie.name,
    };
  }

  static fromMap(Map<String, dynamic> map) {
    return Specie(
      map['name'] as String,
    );
  }

  static String toJson(Specie specie) => json.encode(toMap(specie));

  static fromJson(String source) =>
      fromMap(json.decode(source) as Map<String, dynamic>);
}
