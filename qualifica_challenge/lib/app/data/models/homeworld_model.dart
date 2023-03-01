class HomeworldModel {
  final String name;

  HomeworldModel({
    required this.name,
  });

  factory HomeworldModel.fromMap(Map<String, dynamic> map) {
    return HomeworldModel(
      name: map['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
