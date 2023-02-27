import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../../services/http/http.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Client get client => Client();

  @lazySingleton
  IHttpClient get httpClient => HttpService(client);
}
