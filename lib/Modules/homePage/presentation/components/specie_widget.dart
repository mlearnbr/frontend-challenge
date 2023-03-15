import 'package:challenge/Modules/homePage/presentation/controller/species_bloc/specie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../Core/baseStates/base_states.dart';

import '../controller/species_bloc/specie_event.dart';
import '../controller/species_bloc/specie_state.dart';

class SpecieWidget extends StatelessWidget {
  final List<String> speciesUrl;
  SpecieWidget({super.key, required this.speciesUrl});
  final specieBloc = Modular.get<SpecieBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => specieBloc,
        child: BlocBuilder<SpecieBloc, AppState>(
          builder: (context, state) {
            if (state is InitialState) {
              return const Center(
                child: Text(""),
              );
            }
            if (state is GettingAllSpeciesState) {
              return const CircularProgressIndicator();
            }
            return OutlinedButton(
                onPressed: () {}, child: Text(specieBloc.species[0].name));
          },
        ));
  }
}
