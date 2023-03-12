class GetPeopleException implements Exception {
  final String message;

  GetPeopleException(this.message);

  @override
  String toString() => message;
}

class GetSpeciesByPeopleIdException implements Exception {
  final String message;

  GetSpeciesByPeopleIdException(this.message);

  @override
  String toString() => message;
}

class GetFilmsException implements Exception {
  final String message;

  GetFilmsException(this.message);

  @override
  String toString() => message;
}