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
    return Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 10,
      child: InkWell(
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
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: _buildImage(),
          ),
          const SizedBox(width: 4),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    character.name,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '(${character.birthYear})',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.network(
        kCharacterImageBaseUrl + character.imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
