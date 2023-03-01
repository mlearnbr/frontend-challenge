class PeopleModel {
  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;
  final String homeworld;
  final List<String> films;
  final List<String>? species;

  PeopleModel({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.films,
    this.species,
  });

  factory PeopleModel.fromMap(Map<String, dynamic> map) {
    return PeopleModel(
      name: map['name'] ?? '',
      height: map['height'] ?? '',
      mass: map['mass'] ?? '',
      hairColor: map['hair_color'] ?? '',
      skinColor: map['skin_color'] ?? '',
      eyeColor: map['eye_color'] ?? '',
      birthYear: map['birth_year'] ?? '',
      gender: map['gender'] ?? '',
      homeworld: map['homeworld'] ?? '',
      films: List<String>.from(map['films'] ?? <String>[]),
      species: List<String>.from(map['species'] ?? <String>[]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'height': height,
      'mass': mass,
      'hair_color': hairColor,
      'skin_color': skinColor,
      'eye_color': eyeColor,
      'birth_year': birthYear,
      'gender': gender,
      'homeworld': homeworld,
      'films': films,
      'species': species,
    };
  }
}
