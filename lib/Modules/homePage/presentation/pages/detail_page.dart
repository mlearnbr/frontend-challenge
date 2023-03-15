import 'package:challenge/Modules/homePage/presentation/components/film_widget.dart';
import 'package:challenge/Modules/homePage/presentation/components/planet_widget.dart';
import 'package:challenge/Modules/homePage/presentation/controller/planet_bloc/planet_bloc.dart';
import 'package:challenge/Modules/homePage/presentation/controller/planet_bloc/planet_event.dart';
import 'package:challenge/Modules/homePage/presentation/controller/species_bloc/specie_bloc.dart';
import 'package:challenge/Modules/homePage/presentation/controller/species_bloc/specie_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../Core/domain/models/people_model.dart';
import '../components/specie_widget.dart';
import '../controller/film_bloc/film_bloc.dart';
import '../controller/film_bloc/film_event.dart';

class PeopleDetailsPage extends StatefulWidget {
  final People people;
  const PeopleDetailsPage({super.key, required this.people});

  @override
  State<PeopleDetailsPage> createState() => _PeopleDetailsPageState();
}

class _PeopleDetailsPageState extends State<PeopleDetailsPage> {
  final filmBloc = Modular.get<FilmBloc>();
  final specieBloc = Modular.get<SpecieBloc>();
  final planetBloc = Modular.get<PlanetBloc>();
  @override
  void initState() {
    super.initState();
    filmBloc.add(FetchFilms(widget.people.films!));
    if (widget.people.species != null) {
      specieBloc.add(FetchSpecies(widget.people.species!));
    }
    if (widget.people.planet != null) {
      planetBloc.add(FetchPlanet(widget.people.planet!));
    }

    //Films
    //Planet
    //Specie
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('teste'),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              children: [
                Text(widget.people.name!),
                FilmWidget(filmsUrl: widget.people.films!),
                // if (widget.people.species != null) ...[
                //   SpecieWidget(
                //     speciesUrl: widget.people.species!,
                //   )
                // ],
                PlanetWidget(planetUrl: widget.people.planet!),
              ],
            );
          },
        ));
  }
}
