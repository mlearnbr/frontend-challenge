import 'package:flutter/material.dart';
import 'package:flutter_application/features/character_list/domain/entities/character_entity.dart';

class CharacterListItemWidget extends StatelessWidget {
  final CharacterEntity character;

  const CharacterListItemWidget({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).pushNamed('/details', arguments: character),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(),
            const SizedBox(height: 8),
            Text(character.name),
            const SizedBox(height: 4),
            Visibility(
              visible: character.species != null,
              child: Text(
                character.species?[0].name ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 4),
            Text(character.birthYear,
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
