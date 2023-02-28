import 'package:dio/dio.dart';

import 'rest_response.dart';
import 'rest_service.dart';

class DioRestService implements RestService {
  final Dio _dio;

  DioRestService({required Dio dio}) : _dio = dio;

  @override
  Future<RestResponse<String>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response;

    response = await _dio.get<String>(
      path,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );

    return _mapResponse(
      response: response,
    );
  }

  RestResponse<String> _mapResponse({
    required Response? response,
  }) {
    return RestResponse<String>(
      data: response?.data,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    );
  }
}
