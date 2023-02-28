import '../../infra/models/people_model.dart';

class PeopleModelMapper {
  PeopleModel fromJson(Map<String, dynamic> json) {
    return PeopleModel(
      name: json['name'] ?? '',
      height: json['height'] ?? '',
      mass: json['mass'] ?? '',
      hairColor: json['hair_color'] ?? '',
      skinColor: json['skin_color'] ?? '',
      eyeColor: json['eye_color'] ?? '',
      birthYear: json['birth_year'] ?? '',
      gender: json['gender'] ?? '',
      homeworld: json['homeworld'] ?? '',
    );
  }
}
