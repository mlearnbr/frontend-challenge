import 'package:flutter_modular/flutter_modular.dart';

import 'app_store.dart';
import 'home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AppStore()),
  ];

  @override
  final List<ModularRoute> routes = [
            ModuleRoute('/home', module: HomeModule()),
  ];
}
