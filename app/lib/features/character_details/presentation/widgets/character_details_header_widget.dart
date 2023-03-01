import 'package:flutter/material.dart';
import 'package:flutter_application/features/character_details/domain/entities/entities.dart';
import 'package:flutter_application/features/character_list/domain/entities/character_entity.dart';

class CharacterDetailsHeaderWidget extends StatelessWidget {
  final CharacterEntity character;
  final CharacterPlanetEntity? characterPlanet;
  const CharacterDetailsHeaderWidget({
    super.key,
    required this.character,
    required this.characterPlanet,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorLight,
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 260,
      ),
      child: Column(
        children: [
          const CircleAvatar(radius: 60),
          const SizedBox(height: 32),
          Text(character.name),
          const SizedBox(height: 8),
          Visibility(
            visible: characterPlanet != null,
            child: Text(
              characterPlanet!.name,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
