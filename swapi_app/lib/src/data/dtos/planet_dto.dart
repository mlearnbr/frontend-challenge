import 'package:swapi_app/src/domain/entities/planet_entity.dart';

class PlanetDto extends PlanetEntity {
  PlanetDto({
    required String name,
    String? rotationPeriod,
    String? orbitalPeriod,
    required String diameter,
    required String climate,
    required String gravity,
    required String terrain,
    String? surfaceWater,
    String? population,
  }) : super(
          name: name,
          climate: climate,
          diameter: diameter,
          gravity: gravity,
          terrain: terrain,
          orbitalPeriod: orbitalPeriod,
          population: population,
          rotationPeriod: rotationPeriod,
          surfaceWater: surfaceWater,
        );

  factory PlanetDto.fromMap(Map<String, dynamic> map) => PlanetDto(
        name: map['name'],
        rotationPeriod: map['rotation_period'] == null ||
                map['rotation_period'] == 'unknown'
            ? null
            : map['rotation_period'],
        orbitalPeriod:
            map['orbital_period'] == null || map['orbital_period'] == 'unknown'
                ? null
                : map['orbital_period'],
        diameter: map['diameter'],
        climate: map['climate'],
        gravity: map['gravity'],
        terrain: map['terrain'],
        population: map['population'] == null || map['population'] == 'unknown'
            ? null
            : map['population'],
        surfaceWater:
            map['surface_water'] == null || map['surface_water'] == 'unknown'
                ? null
                : map['surface_water'],
      );
}
