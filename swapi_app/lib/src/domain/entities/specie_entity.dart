class SpecieEntity {
  final String name;
  final String classification;
  final String designation;
  final String? averageHeight;
  final String? skinColors;
  final String? hairColors;
  final String? eyeColors;
  final String? averageLifespan;
  final String? homeworld;
  final String? language;
  final String url;

  SpecieEntity({
    required this.name,
    required this.classification,
    required this.designation,
    this.averageHeight,
    this.skinColors,
    this.hairColors,
    this.eyeColors,
    this.averageLifespan,
    this.homeworld,
    this.language,
    required this.url,
  });

  List<Object?> get props => [
        name,
        classification,
        designation,
        averageHeight,
        skinColors,
        hairColors,
        eyeColors,
        averageLifespan,
        homeworld,
        language,
        url,
      ];
}
