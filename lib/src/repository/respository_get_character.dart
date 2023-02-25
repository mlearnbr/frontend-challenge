import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base_url/base_url_api.dart';
import '../interface/interface_respository.dart';
import '../model/model_response_people.dart';

class RespositoryGetCharacter implements InterfaceRespository {
  List<ResultCharacter> model = [];
  final GetConnect getConnect;

  RespositoryGetCharacter(this.getConnect);
  @override
  Future<List<ResultCharacter>> getCharacter({int? page}) async {
    final response = await getConnect.get(BaseUrlApi.people);
    final convert = response.body;
    if (response.statusCode == 200) {
      final data = responseModelPeopleFromJson(convert);
      model = data.results;
      debugPrint(response.body);
    }
    return model;
  }
}
