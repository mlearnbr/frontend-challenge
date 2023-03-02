import 'package:swapi_app/src/domain/entities/specie_entity.dart';
import 'package:swapi_app/src/domain/repositories/species_repository.dart';
import 'package:swapi_app/src/domain/usecases/get_specie_by_url/get_sprecie_by_url.dart';

class GetSpecieByUrlUseCaseImpl implements GetSpecieByUrlUseCase {
  final SpeciesRepository repository;

  GetSpecieByUrlUseCaseImpl({
    required this.repository,
  });

  @override
  Future<SpecieEntity> call({required String url}) async {
    return await repository.getSpecieByUrl(
      url: url,
    );
  }
}
