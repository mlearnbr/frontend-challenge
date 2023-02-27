import 'package:get/get.dart';

import '../base_url/base_url_api.dart';
import '../interface/interface_repository_character.dart';
import '../model/model_response_people.dart';

class RepositoryGetCharacter implements InterfaceRepositoryCharacter {
  List<ResultCharacter> model = [];
  final GetConnect getConnect;

  RepositoryGetCharacter(this.getConnect);
  @override
  Future<List<ResultCharacter>> getCharacter({int? page = 1}) async {
    final response = await getConnect.get(
      BaseUrlApi.people,
    );
    final convertToString = response.bodyString;
    if (response.statusCode == 200) {
      final data = responseModelPeopleFromJson(convertToString!);
      model = data.results;
    }
    return model;
  }
}
