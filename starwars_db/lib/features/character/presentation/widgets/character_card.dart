import 'package:flutter/material.dart';
import 'package:starwars_db/core/constants/constants.dart';
import 'package:starwars_db/features/character/domain/entities/character.dart';
import 'package:starwars_db/features/character/presentation/screens/character_details_screen.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _buildImage(),
      title: Text(character.name),
      subtitle: Text(character.birthYear),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => CharacterDetailsScreen(
              character: character,
            ),
          ),
        );
      },
    );
  }

  Widget _buildImage() {
    const width = 40.0;
    return ClipRRect(
      borderRadius: BorderRadius.circular(width),
      child: SizedBox(
        width: 40,
        height: 40,
        child: Image.network(
          kCharacterImageBaseUrl + character.imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
