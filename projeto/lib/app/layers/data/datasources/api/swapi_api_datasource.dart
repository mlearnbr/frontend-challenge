import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:star_wars_app/app/layers/domain/models/result_api_model.dart';

import '../../../../shared/helpers/consts.dart';

class SwapiApiDatasource {
  //final _uri = Uri(host: Api.baseUrl, scheme: 'https');
  final _dio = Dio(BaseOptions(baseUrl: Api.baseUrl, headers: _headers));

  /// Obtem os dez primeiros personagens Starwars.
  /// Caso sucesso, retorna um ResultApiModel com a lista no 'object'.
  /// Caso dê erro, retorna um ResultApiModel com
  /// o 'object' null e a mensagem de erro em 'error'.
  Future<ResultApiModel> getAllPersons() async {
    try {
      var response = await _dio.get(Api.pathPeople);
      try {
        var data = Map<String, dynamic>.from((response.data));

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

  /// Obtem os dez primeiros personagens Starwars.
  /// Caso sucesso, retorna um ResultApiModel com a lista no 'object'.
  /// Caso dê erro, retorna um ResultApiModel com
  /// o 'object' null e a mensagem de erro em 'error'.
  Future<String> getNameSpecie(String specieUrl) async {
    try {
      var response = await _dio.getUri(Uri.parse(specieUrl));
      try {
        var data = Map<String, dynamic>.from((response.data));

        if (response.statusCode == 200) {
          var results = data['name'].toString();

          return results;
        } else {
          debugPrint(response.statusCode.toString());
          return '';
        }
      } on Exception catch (e) {
        debugPrint(e.toString());
        return '';
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      return '';
    }
  }
}

const _headers = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Accept': '*/*',
};
