import 'package:swapi_app/src/domain/entities/specie_entity.dart';

abstract class GetSpecieByUrlUseCase {
  Future<SpecieEntity> call({
    required String url,
  });
}
