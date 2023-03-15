import 'package:equatable/equatable.dart';

abstract class PlanetEvent extends Equatable {
  const PlanetEvent();
  @override
  List<Object> get props => [];
}

class FetchPlanet extends PlanetEvent {
  final String planetUrl;
  const FetchPlanet(this.planetUrl);
}
