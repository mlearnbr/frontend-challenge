
import '../../domain/entities/specie_entity.dart';

abstract class GetSpeciesByPeopleIdDatasource {
  Future<SpecieEntity> getSpeciesByPeopleId(String id);
}