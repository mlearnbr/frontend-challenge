class FilmsEntity {
  final String title;
  final List characters;
  final String? openingCrawl;
  final DateTime created;
  final String url;

  FilmsEntity({
    required this.title,
    required this.characters,
    required this.openingCrawl,
    required this.created,
    required this.url,
  });
}