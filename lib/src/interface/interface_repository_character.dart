import '../model/model_response_people.dart';

abstract class InterfaceRepositoryCharacter {
  Future<List<ResultCharacter>> getCharacter({int? page});
}
