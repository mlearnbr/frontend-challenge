import '../model/model_response_people.dart';

abstract class InterfaceRespository {
  Future<List<ResultCharacter>> getCharacter({int? page});
}
