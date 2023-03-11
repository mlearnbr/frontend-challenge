
import '../../domain/entities/specie_entity.dart';

abstract class GetSpeciesDatasource {
  Future<SpecieEntity> getSpecies(String id);
}