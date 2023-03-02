import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String name;
  final String birthYear;
  final String eyeColor;
  final String gender;
  final String hairColor;
  final String height;
  final String mass;
  final String skinColor;
  final String homeWorldUrl;
  final List<String> filmsUrls;
  final List<String> speciesUrls;
  final String imagePath;

  const Character({
    required this.name,
    required this.birthYear,
    required this.eyeColor,
    required this.gender,
    required this.hairColor,
    required this.height,
    required this.mass,
    required this.skinColor,
    required this.homeWorldUrl,
    required this.filmsUrls,
    required this.speciesUrls,
    required this.imagePath,
  });

  @override
  List<Object?> get props => [
        name,
        birthYear,
        eyeColor,
        gender,
        hairColor,
        height,
        mass,
        skinColor,
        homeWorldUrl,
        filmsUrls,
        speciesUrls,
        imagePath,
      ];
}
