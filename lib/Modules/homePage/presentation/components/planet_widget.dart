import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../Core/baseStates/base_states.dart';
import '../controller/planet_bloc/planet_bloc.dart';
import '../controller/planet_bloc/planet_state.dart';

class PlanetWidget extends StatelessWidget {
  final String planetUrl;
  PlanetWidget({super.key, required this.planetUrl});
  final planetBloc = Modular.get<PlanetBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => planetBloc,
        child: BlocBuilder<PlanetBloc, AppState>(
          builder: (context, state) {
            if (state is InitialState) {
              return const Center(
                child: Text(""),
              );
            }
            if (state is GettingPlanetState) {
              return const CircularProgressIndicator();
            }
            return OutlinedButton(
                onPressed: () {}, child: Text(planetBloc.planet.name));
          },
        ));
  }
}
