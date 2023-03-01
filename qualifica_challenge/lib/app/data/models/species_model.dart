class SpeciesModel {
  final String name;

  SpeciesModel({
    required this.name,
  });

  factory SpeciesModel.fromMap(Map<String, dynamic> map) {
    return SpeciesModel(
      name: map['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
