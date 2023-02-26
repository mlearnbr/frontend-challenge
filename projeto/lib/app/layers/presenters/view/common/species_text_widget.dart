import 'package:flutter/material.dart';

import '../../../../shared/dependency_injection/dependency_injection.dart';
import '../../../domain/models/person_model.dart';
import '../../controllers/persons_controller.dart';

class SpeciesTextWidget extends StatelessWidget {
  const SpeciesTextWidget({
    Key? key,
    required this.person,
  }) : super(key: key);

  final PersonModel person;

  @override
  Widget build(BuildContext context) {
    final controller = inject.get<PersonsController>();
    return Container(
      child: person.species.isNotEmpty
          ? Row(
              children: person.species.map((specieUrl) {
                return FutureBuilder<String>(
                    future: controller.getSpecie(specieUrl),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          '${snapshot.data!} ',
                          style: Theme.of(context).textTheme.bodyText1,
                        );
                      }
                      return Text(
                        '...',
                        style: Theme.of(context).textTheme.bodyText1,
                      );
                    });
              }).toList(),
            )
          : Text(
              'Specie undefined',
              style: Theme.of(context).textTheme.bodyText1,
            ),
    );
  }
}
