import '../model/model_response_people.dart';

abstract class InterfaceProvider {
  Future<List<ResultCharacter>> getCharacter({int? page});
}
