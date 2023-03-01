import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import 'http_client.dart';
import 'http_error.dart';
import 'http_response.dart';

@injectable
class HttpService implements IHttpClient {
  final Client client;
  HttpService(this.client);

  @override
  Future<HttpResponse> get(String url) async {
    final Response response = await client.get(Uri.parse(url));
    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return HttpResponse(
            data: response.body, statusCode: response.statusCode);
      case 204:
        return null;
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      default:
        throw HttpError.serverError;
    }
  }
}
