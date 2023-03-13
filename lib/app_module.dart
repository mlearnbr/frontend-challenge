import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';

import 'Core/infra/http/http_adapter.dart';
import 'Modules/homePage/home_page_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HttpClient()),
        Bind((i) => HttpAdapter(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomePageModule()),
      ];
}
