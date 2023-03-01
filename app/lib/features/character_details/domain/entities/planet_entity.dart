import 'package:equatable/equatable.dart';

class PlanetEntity extends Equatable {
  final String name;

  const PlanetEntity({
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}
