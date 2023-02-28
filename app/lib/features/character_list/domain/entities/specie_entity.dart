import 'package:equatable/equatable.dart';

class SpecieEntity extends Equatable {
  final String name;
  final String classification;
  final String designation;
  final String averageHeight;
  final String skinColors;
  final String hairColors;
  final String eyeColors;
  final String averageLifespan;
  final String? homeworld;
  final String language;
  final List<String> people;
  final List<String> films;

  const SpecieEntity({
    required this.name,
    required this.classification,
    required this.designation,
    required this.averageHeight,
    required this.skinColors,
    required this.hairColors,
    required this.eyeColors,
    required this.averageLifespan,
    required this.language,
    required this.homeworld,
    required this.people,
    required this.films,
  });

  @override
  List<Object?> get props => [
        name,
        classification,
        designation,
        averageHeight,
        skinColors,
        hairColors,
        eyeColors,
        averageLifespan,
        language,
        homeworld,
        people,
        films
      ];
}
