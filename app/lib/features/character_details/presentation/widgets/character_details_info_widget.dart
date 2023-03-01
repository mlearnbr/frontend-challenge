import 'package:flutter/material.dart';
import 'package:flutter_application/features/character_details/domain/entities/character_film_entity.dart';
import 'package:flutter_application/features/character_list/domain/entities/character_entity.dart';

class CharacterDetailsInfoWidget extends StatelessWidget {
  final CharacterEntity character;
  final List<CharacterFilmEntity> characterFilms;
  const CharacterDetailsInfoWidget({
    super.key,
    required this.character,
    required this.characterFilms,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          Text(
            'Birth Year: ${character.birthYear}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          Text(
            'Gender: ${character.gender}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          Text(
            'Eye Color: ${character.eyeColor}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          Text(
            'Height: ${character.height}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          Text(
            'Mass: ${character.mass}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          Text(
            'Skin Color: ${character.skinColor}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          Text(
            'Films:',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            itemCount: characterFilms.length,
            itemBuilder: (context, index) {
              return Text(
                characterFilms[index].title,
                style: Theme.of(context).textTheme.bodySmall,
              );
            },
          ),
          const SizedBox(height: 16),
          Visibility(
            visible: character.species != null,
            child: Text(
              'Species: ${character.species?[0].name}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        ],
      ),
    );
  }
}
