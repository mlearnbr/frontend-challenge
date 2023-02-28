import 'package:flutter/material.dart';
import 'package:flutter_application/features/character_list/domain/controllers/character_list_controller.dart';

import '../../../../core/config/injection/injection.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({super.key});

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  final ICharacterListController controller = getIt();
  @override
  void initState() {
    super.initState();
    controller.getCharacterList();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
