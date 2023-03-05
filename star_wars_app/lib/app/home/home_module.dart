import 'package:star_wars_app/app/home/character/character_page.dart';
import 'package:star_wars_app/app/home/character/character_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/app/home/home_page.dart';
import 'package:star_wars_app/app/home/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CharacterStore(i.args.data)),
    Bind((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
    ChildRoute('/character/:uid', child: (_, args) => CharacterPage(uid: args.params['uid']))
  ];
}
