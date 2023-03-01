import 'package:flutter/material.dart';

import '../../../data/models/films_model.dart';
import '../../../data/models/homeworld_model.dart';
import '../../../data/models/people_model.dart';
import '../../../data/models/species_model.dart';
import '../widgets/description_widget.dart';

class DetailsPage extends StatelessWidget {
  final PeopleModel peopleModel;
  final SpeciesModel speciesModel;
  final HomeworldModel homeworldModel;
  final List<FilmsModel> listFilmsModel;

  const DetailsPage({
    required this.peopleModel,
    required this.speciesModel,
    required this.homeworldModel,
    required this.listFilmsModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(peopleModel.name.toUpperCase()),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DescriptionWidget(
                  title: 'Birth Year: ',
                  data: peopleModel.birthYear,
                ),
                DescriptionWidget(
                  title: 'Eye Color: ',
                  data: peopleModel.eyeColor.toUpperCase(),
                ),
                DescriptionWidget(
                  title: 'Gender: ',
                  data: peopleModel.gender.toUpperCase(),
                ),
                DescriptionWidget(
                  title: 'Hair Color: ',
                  data: peopleModel.hairColor.toUpperCase(),
                ),
                DescriptionWidget(
                  title: 'Height: ',
                  data: peopleModel.height,
                ),
                DescriptionWidget(
                  title: 'Mass: ',
                  data: peopleModel.mass,
                ),
                DescriptionWidget(
                  title: 'Skin Color: ',
                  data: peopleModel.skinColor.toUpperCase(),
                ),
                DescriptionWidget(
                  title: 'Homeworld: ',
                  data: homeworldModel.name.toUpperCase(),
                ),
                DescriptionWidget(
                  title: 'Species: ',
                  data: speciesModel.name == ''
                      ? 'HUMAN'
                      : speciesModel.name.toUpperCase(),
                ),
                const Text('Films: '),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Wrap(
                    spacing: 30,
                    children: List<Widget>.generate(
                      listFilmsModel.length,
                      (index) => Chip(
                        backgroundColor: Colors.yellow,
                        label: Text(
                          listFilmsModel[index].title,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
