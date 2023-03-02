import 'package:swapi_app/src/domain/entities/specie_entity.dart';

abstract class SpeciesRepository {
  Future<SpecieEntity> getSpecieByUrl({
    required String url,
  });
}
