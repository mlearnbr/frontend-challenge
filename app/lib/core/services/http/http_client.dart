import 'http_response.dart';

abstract class IHttpClient {
  Future<HttpResponse> get(String url);
}
