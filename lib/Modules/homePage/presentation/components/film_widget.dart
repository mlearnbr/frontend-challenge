import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../Core/baseStates/base_states.dart';
import '../controller/film_bloc/film_bloc.dart';
import '../controller/film_bloc/film_event.dart';
import '../controller/film_bloc/film_state.dart';

class FilmWidget extends StatelessWidget {
  final List<String> filmsUrl;
  FilmWidget({super.key, required this.filmsUrl});
  final filmBloc = Modular.get<FilmBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => filmBloc,
        child: BlocBuilder<FilmBloc, AppState>(
          builder: (context, state) {
            if (state is InitialState) {
              return const Center(
                child: Text(""),
              );
            }
            if (state is GettingAllFilmsState) {
              return const CircularProgressIndicator();
            }
            return OutlinedButton(
                onPressed: () {}, child: Text(filmBloc.films[0].title));
          },
        ));
  }
}
