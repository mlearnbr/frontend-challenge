import 'package:flutter/material.dart';
import '../details/details_page.dart';
import '../../../../shared/theme/colors_theme_const.dart';

import '../../../../shared/dependency_injection/dependency_injection.dart';
import '../../../domain/states/persons_states_model.dart';
import '../../controllers/persons_controller.dart';
import '../common/species_text_widget.dart';
import 'widgets/dialog_filter_films_widget.dart';
import 'widgets/head_title_home_widget.dart';

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
          const HeadTitleHome(),
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerRight,
                    child: ValueListenableBuilder(
                      valueListenable: controller.filterFilm,
                      builder: (context, value, child) => Text(
                        value
                            .toString()
                            .replaceAll('[', '')
                            .replaceAll(']', ''),
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 4,
                      ),
                    ),
                  ),
                ),
                //  const SizedBox(width: 8),
                TextButton.icon(
                  onPressed: (() {
                    showDialogFilterFilms(context, controller);
                  }),
                  icon: const Icon(Icons.filter_list_alt),
                  label: const Text('Filters'),
                )
              ],
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
                                focusColor: themeYellowLight1.withOpacity(0.25),
                                hoverColor: themeYellowLight1.withOpacity(0.25),
                                highlightColor:
                                    themeYellowLight1.withOpacity(0.1),
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
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  visualDensity: VisualDensity.comfortable,
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        person.birthYear,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      InfoTextUrlWidget(
                                        list: person.species,
                                        label: 'Specie',
                                      ),
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
