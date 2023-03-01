import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../../network/network.dart';
import '../../services/http/http.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Client get client => Client();

  @lazySingleton
  IHttpClient get httpClient => HttpService(client);

  @lazySingleton
  INetworkInfo get networkInfo => NetworkInfoService(Connectivity());

  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
