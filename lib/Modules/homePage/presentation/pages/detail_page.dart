import 'package:flutter/material.dart';

import '../../../../Core/domain/models/people_model.dart';
import '../components/film_widget.dart';
import '../components/specie_widget.dart';

class PeopleDetailsPage extends StatefulWidget {
  final People people;
  const PeopleDetailsPage({super.key, required this.people});

  @override
  State<PeopleDetailsPage> createState() => _PeopleDetailsPageState();
}

class _PeopleDetailsPageState extends State<PeopleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.people.name!),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (_, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${widget.people.name ?? ''}'),
                  Text('Birth year: ${widget.people.birthYear ?? ''}'),
                  Text('Eye Color:${widget.people.eyeColor ?? ''}'),
                  Text('Gender: ${widget.people.gender ?? ''}'),
                  Text('Hair Color: ${widget.people.hairColor ?? ''}'),
                  Text('height: ${widget.people.height ?? ''} '),
                  Text('mass: ${widget.people.mass ?? ''}'),
                  Text('skin Color: ${widget.people.skinColor ?? ''}'),
                  FilmWidget(filmsUrl: widget.people.films!),
                  SpecieWidget(
                    speciesUrl: widget.people.species!,
                  )
                ],
              ),
            );
          },
        ));
  }
}
