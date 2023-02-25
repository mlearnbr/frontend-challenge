import '../interface/interface_provider.dart';
import '../model/model_response_people.dart';
import '../repository/respository_get_character.dart';

class ProviderGetCharacter implements InterfaceProvider {
  final RespositoryGetCharacter interfaceRespository;

  ProviderGetCharacter(this.interfaceRespository);
  @override
  Future<List<ResultCharacter>> getCharacter({int? page}) async {
    final response = await interfaceRespository.getCharacter();
    return response;
  }
}
