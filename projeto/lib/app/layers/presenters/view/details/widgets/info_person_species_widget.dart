import 'package:flutter/material.dart';
import '../../../../domain/models/person_model.dart';
import '../../common/species_text_widget.dart';

class InfoPersonSpecies extends StatelessWidget {
  const InfoPersonSpecies({
    Key? key,
    required this.person,
  }) : super(key: key);

  final PersonModel person;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [const Text('Species: '), SpeciesTextWidget(person: person)],
      ),
    );
  }
}
