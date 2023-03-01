import 'package:flutter/material.dart';

import '../../home/domain/entities/people_entity.dart';
import 'widgets/tile_widget.dart';

class DetalhesScreen extends StatelessWidget {
  final PeopleEntity peopleEntity;

  const DetalhesScreen({
    super.key,
    required this.peopleEntity,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          peopleEntity.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              peopleEntity.name,
              style: theme.textTheme.headlineMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Divider(),
            TileWidget(
              visible: peopleEntity.birthYear != 'unknown',
              title: 'Birth year',
              value: peopleEntity.birthYear,
            ),
            TileWidget(
              title: 'Eye color',
              value: peopleEntity.eyeColor,
            ),
            TileWidget(
              visible: peopleEntity.gender != 'n/a',
              title: 'Gender',
              value: peopleEntity.gender,
            ),
            TileWidget(
              visible: peopleEntity.hairColor != 'n/a',
              title: 'Hair color',
              value: peopleEntity.hairColor,
            ),
            TileWidget(
              title: 'Height',
              value: peopleEntity.height,
            ),
            TileWidget(
              title: 'Mass',
              value: peopleEntity.mass,
            ),
            TileWidget(
              title: 'Skin color',
              value: peopleEntity.skinColor,
            ),
            TileWidget(
              visible: peopleEntity.species.isNotEmpty,
              title: 'Species',
              value: peopleEntity.species
                  .map<String>((specie) => specie.name)
                  .toString(),
            ),
            TileWidget(
              visible: peopleEntity.films.isNotEmpty,
              title: 'Films',
              value: peopleEntity.films
                  .map<String>((film) => film.title)
                  .toString(),
            ),
          ],
        ),
      ),
    );
  }
}
