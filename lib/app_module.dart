import 'package:flutter_modular/flutter_modular.dart';

import 'Modules/homePage/home_page_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomePageModule()),
      ];
}
