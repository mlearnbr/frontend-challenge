import 'package:star_wars_app/app/home/home_module.dart';
import 'package:star_wars_app/app/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/app/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
