import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/app/home/character/character_page.dart';
import 'package:star_wars_app/app/home/character/character_store.dart';

class CharacterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      (i) => CharacterStore(i.args.data),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CharacterPage(uid: args.data))
  ];
}
