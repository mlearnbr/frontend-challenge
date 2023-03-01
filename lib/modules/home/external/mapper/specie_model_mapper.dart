import '../../infra/models/specie_model.dart';

class SpecieModelMapper {
  SpecieModel fromJson(Map<String, dynamic> json) {
    return SpecieModel(
      name: json['name'] ?? '',
      classification: json['classification'] ?? '',
      designation: json['designation'] ?? '',
    );
  }
}
