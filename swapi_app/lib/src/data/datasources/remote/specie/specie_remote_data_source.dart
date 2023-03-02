import 'package:swapi_app/src/data/dtos/specie_dto.dart';

abstract class SpecieRemoteDataSource {
  Future<SpecieDto> getSpecieByUrl({
    required String url,
  });
}
