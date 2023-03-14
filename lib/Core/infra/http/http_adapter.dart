import 'dart:convert';

import 'package:http/http.dart';

import '../../data/http/http.dart';
import '../../enums/methods_enum.dart';

class HttpAdapter implements HttpClient {
  final Client client;
  HttpAdapter(
    this.client,
  );

  @override
  Future<Map<String, dynamic>> request({
    required String url,
    required MethodEnum method,
    Map? body,
  }) async {
    final headers = {
      'content-type': 'application/json',
      'accept': 'application/json'
    };
    final jsonBody = body != null ? jsonEncode(body) : null;
    var response = Response('', 500);
    try {
      switch (method) {
        case MethodEnum.post:
          response = await client.post(
            Uri.parse(url),
            headers: headers,
            body: jsonBody,
          );
          break;
        case MethodEnum.get:
          response = await client.get(
            Uri.parse(url),
            headers: headers,
          );
          break;
        default:
          break;
      }
    } catch (error) {
      throw HttpError.serverError;
    }

    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.body.isEmpty ? null : jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      throw HttpError.badRequest;
    } else if (response.statusCode == 401) {
      throw HttpError.unauthorized;
    } else if (response.statusCode == 403) {
      throw HttpError.forbidden;
    } else if (response.statusCode == 404) {
      throw HttpError.notFound;
    } else {
      throw HttpError.serverError;
    }
  }
}
