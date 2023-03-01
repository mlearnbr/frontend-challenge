import '../../domain/entities/specie_entity.dart';
import '../models/specie_model.dart';

class SpecieEntityAdapter {
  SpecieEntity fromModel({
    required SpecieModel specieModel,
  }) {
    return SpecieEntity(
      name: specieModel.name,
      classification: specieModel.classification,
      designation: specieModel.designation,
    );
  }
}
