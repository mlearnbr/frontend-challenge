class FilmsModel {
  final String title;
  final List<String> characters;

  FilmsModel({
    required this.title,
    required this.characters,
  });

  factory FilmsModel.fromMap(Map<String, dynamic> map) {
    return FilmsModel(
      title: map['title'] ?? '',
      characters: List<String>.from(map['characters'] ?? <String>[]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'characters': characters,
    };
  }
}
