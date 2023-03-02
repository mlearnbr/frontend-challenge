class PlanetEntity {
  final String name;
  final String? rotationPeriod;
  final String? orbitalPeriod;
  final String diameter;
  final String climate;
  final String gravity;
  final String terrain;
  final String? surfaceWater;
  final String? population;

  PlanetEntity({
    required this.name,
    this.rotationPeriod,
    this.orbitalPeriod,
    required this.diameter,
    required this.climate,
    required this.gravity,
    required this.terrain,
    this.surfaceWater,
    this.population,
  });

  List<Object?> get props => [
        name,
        rotationPeriod,
        orbitalPeriod,
        diameter,
        climate,
        gravity,
        terrain,
        surfaceWater,
        population,
      ];
}
