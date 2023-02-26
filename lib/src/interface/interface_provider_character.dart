import '../model/model_response_people.dart';

abstract class InterfaceProviderCharacter {
  Future<List<ResultCharacter>> getCharacter({int? page});
}
