class GetPeopleException implements Exception {
  final String message;

  GetPeopleException(this.message);

  @override
  String toString() => message;
}

class GetSpeciesException implements Exception {
  final String message;

  GetSpeciesException(this.message);

  @override
  String toString() => message;
}