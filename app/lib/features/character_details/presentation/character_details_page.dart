import 'package:flutter/material.dart';
import 'package:flutter_application/features/character_details/presentation/widgets/widgets.dart';
import 'package:flutter_application/features/character_list/domain/entities/character_entity.dart';

class CharacterDetailsPage extends StatelessWidget {
  final CharacterEntity character;
  const CharacterDetailsPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CharacterDetailsHeaderWidget(character: character),
            CharacterDetailsInfoWidget(character: character),
          ],
        ),
      ),
    );
  }
}
