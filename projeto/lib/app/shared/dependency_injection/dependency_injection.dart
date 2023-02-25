import 'package:get_it/get_it.dart';
import '../../layers/data/datasources/api/swapi_api_datasource.dart';

GetIt inject = GetIt.I;

initInject() {
// datasources
  inject.registerLazySingleton<SwapiApiDatasource>(() => SwapiApiDatasource());

//repositories
  ///
  ///
  ///

// controllers
  ///
  ///
  ///
}
