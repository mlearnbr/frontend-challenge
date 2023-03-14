import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

import 'Core/infra/http/http_adapter.dart';

import 'Modules/homePage/home_page_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Client()),
        Bind.singleton((i) => HttpAdapter(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomePageModule()),
      ];
}
