class PeopleEntity {
  final String name;
  final String? birthYear;
  final String heigth;
  final String mass;
  final String? hairColor; //n/a
  final String skinColor;
  final String eyeColor;
  final String? gender; //n/a
  final String homeworld;
  final List<String> films;

  PeopleEntity({
    required this.name,
    this.birthYear,
    required this.heigth,
    required this.mass,
    this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    this.gender,
    required this.homeworld,
    required this.films,
  });

  List<Object?> get props => [
        name,
        birthYear,
        heigth,
        mass,
        hairColor,
        skinColor,
        eyeColor,
        gender,
        homeworld,
        films,
      ];
}
