import 'package:challenge/Core/enums/methods_enum.dart';

abstract class HttpClient {
  Future<Map<String, dynamic>> request({
    required String url,
    required MethodEnum method,
    Map body,
  });
}
