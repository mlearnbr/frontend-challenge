import 'package:flutter/material.dart';
import 'package:star_wars_app/app/layers/presenters/view/details/widgets/info_person_species_widget.dart';
import 'package:star_wars_app/app/shared/helpers/get_films_of_persons.dart';

import '../../../../shared/dependency_injection/dependency_injection.dart';
import '../../controllers/persons_controller.dart';
import 'widgets/info_person_row_widget.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});
  static const route = '/details';

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final controller = inject.get<PersonsController>();

  @override
  void initState() {
    if (controller.personSelected == null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.pop(context);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.personSelected == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      var person = controller.personSelected!;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 70,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(16),
                child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      controller.personSelected = null;
                      Navigator.pop(context);
                    }),
              ),
              Column(
                children: [
                  Text(
                    person.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(shadows: [
                      const Shadow(
                        offset: Offset(-4, 4),
                        color: Colors.black,
                      )
                    ]),
                    semanticsLabel: 'Character name',
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InfoPersonRow(
                              title: 'Birth Year: ',
                              value: person.birthYear,
                            ),
                            InfoPersonRow(
                              title: 'Eye Color: ',
                              value: person.eyeColor,
                            ),
                            InfoPersonRow(
                              title: 'Gender: ',
                              value: person.gender,
                            ),
                            InfoPersonRow(
                              title: 'Hair Color: ',
                              value: person.hairColor,
                            ),
                            InfoPersonRow(
                              title: 'Height: ',
                              value: person.height,
                            ),
                            InfoPersonRow(
                              title: 'Mass: ',
                              value: person.mass,
                            ),
                            InfoPersonRow(
                              title: 'Skin Color: ',
                              value: person.skinColor,
                            ),
                            InfoPersonRow(
                              title: 'Hair Color: ',
                              value: person.hairColor,
                            ),
                            InfoPersonSpecies(
                                list: [person.homeworld], label: 'Homeworld'),
                            InfoPersonRow(
                              title: 'Films: ',
                              value: getFilmsPerson(person.films),
                            ),
                            InfoPersonSpecies(
                              list: person.species,
                              label: 'Specie',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}
