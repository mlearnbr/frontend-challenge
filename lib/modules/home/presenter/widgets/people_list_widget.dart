import 'package:flutter/material.dart';

import '../../domain/entities/people_entity.dart';

class PeopleListWidget extends StatelessWidget {
  final PeopleEntity people;
  final Function()? onCarPeople;

  const PeopleListWidget({
    super.key,
    required this.people,
    this.onCarPeople,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: InkWell(
        onTap: onCarPeople,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                people.name,
                style: theme.textTheme.titleLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Visibility(
                    visible: people.birthYear != 'unknown',
                    child: Text(
                      people.birthYear,
                      style: theme.textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Visibility(
                    visible: people.species.isNotEmpty &&
                        people.birthYear != 'unknown',
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      child: Text(
                        '|',
                        style: theme.textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: people.species.isNotEmpty,
                    child: Text(
                      people.species
                          .map<String>((specie) => specie.name)
                          .toString(),
                      style: theme.textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
