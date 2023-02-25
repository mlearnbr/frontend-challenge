import '../interface/interface_provider.dart';
import '../interface/interface_respository.dart';
import '../model/model_response_people.dart';

class ProviderGetCharacter implements InterfaceProvider {
  final InterfaceRespository interfaceRespository;

  ProviderGetCharacter(this.interfaceRespository);
  @override
  Future<List<ResultCharacter>> getCharacter({int? page}) async {
    final response = await interfaceRespository.getCharacter();
    return response;
  }
}
