import '../../models/species_model.dart';

abstract class GetSpeciesRepository {
  Future<SpeciesModel> getSpeciesRepository(String url);
}
