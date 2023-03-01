import 'package:equatable/equatable.dart';

class CharacterPlanetEntity extends Equatable {
  final String name;

  const CharacterPlanetEntity({
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}
