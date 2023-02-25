import 'package:flutter/material.dart';
import 'package:star_wars_app/app/layers/presenters/view/details/details_page.dart';
import 'package:star_wars_app/app/shared/theme/colors_theme_const.dart';

import '../../../../shared/dependency_injection/dependency_injection.dart';
import '../../../domain/states/persons_states_model.dart';
import '../../controllers/persons_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = inject.get<PersonsController>();

  @override
  void initState() {
    controller.loadingListHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 100,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            child: Text(
              'Learn more about your favorite Star Wars character',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: controller.personsState,
            builder: (context, value, child) {
              if (value is PersonsSuccessState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: value.data
                      .map((person) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 8),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: InkWell(
                                focusColor: themeBlueLight1.withOpacity(0.2),
                                hoverColor: themeBlueLight1.withOpacity(0.1),
                                highlightColor:
                                    themeBlueLight1.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15),
                                onTap: (() {
                                  controller.personSelected = person;
                                  Navigator.pushNamed(
                                      context, DetailsPage.route,
                                      arguments: person);
                                }),
                                child: ListTile(
                                  isThreeLine: true,
                                  title: Text(
                                    person.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  visualDensity: VisualDensity.comfortable,
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(person.birthYear),
                                      person.species.isNotEmpty
                                          ? Row(
                                              children: person.species
                                                  .map((specieUrl) {
                                                return FutureBuilder<String>(
                                                    future: controller
                                                        .getSpecie(specieUrl),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot.hasData) {
                                                        return Text(
                                                            '${snapshot.data!} ');
                                                      }
                                                      return const Text('...');
                                                    });
                                              }).toList(),
                                            )
                                          : const Text('Specie undefined'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }
}
