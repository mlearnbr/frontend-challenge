import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application/app/layers/domain/models/result_api_model.dart';

import '../../../../shared/helpers/consts.dart';

class SwapiApiDatasource {
  //final _uri = Uri(host: Api.baseUrl, scheme: 'https');
  var dio = Dio(BaseOptions(baseUrl: Api.baseUrl, headers: _headers));

  /// Obtem todos os personagens Starwars.
  /// Caso sucesso, retorna um ResultApiModel com a lista no 'object'.
  /// Caso dê erro, retorna um ResultApiModel com
  /// o 'object' null e a mensagem de erro em 'error'.
  Future<ResultApiModel> getAllPersons() async {
    try {
      var response = await dio.get(Api.pathPeople);

      try {
        var data = Map<String, dynamic>.from(jsonDecode(response.data));

        if (response.statusCode == 200) {
          var results =
              ResultApiModel(List<Map<String, dynamic>>.from(data['results']));

          return results;
        } else {
          debugPrint(response.statusCode.toString());
          return ResultApiModel(null, error: data['message'].toString());
        }
      } on Exception catch (e) {
        debugPrint(e.toString());
        return ResultApiModel(null, error: e.toString());
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      return ResultApiModel(null, error: e.toString());
    }
  }
}

const _headers = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Accept': '*/*',
};
