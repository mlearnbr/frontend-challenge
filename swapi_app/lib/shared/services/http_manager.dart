import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}

class HttpManager {
  Future<Map<String, dynamic>> restRequest({
    required String url,
    required String method,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    final dio = Dio();
    final defaultParameters = queryParameters?.cast<String, dynamic>() ?? {};
    try {
      final response = await dio.request(
        url,
        options: Options(
          method: method,
        ),
        queryParameters: defaultParameters,
        data: body,
      );
      return response.data;
    } on DioError catch (e) {
      final response = e.response?.data ?? {};
      response['statusCode'] = e.response?.statusCode ?? 500;
      return response;
    } catch (err) {
      return {
        'statusCode': 500,
        'message': 'No connection to server',
      };
    }
  }
}
