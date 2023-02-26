import '../interface/interface_provider_character.dart';
import '../model/model_response_people.dart';
import '../repository/repository_get_character.dart';

class ProviderGetCharacter implements InterfaceProviderCharacter {
  final RepositoryGetCharacter interfaceRespository;

  ProviderGetCharacter(this.interfaceRespository);
  @override
  Future<List<ResultCharacter>> getCharacter({int? page}) async {
    final response = await interfaceRespository.getCharacter();
    return response;
  }
}
