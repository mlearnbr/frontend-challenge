import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../Core/baseStates/base_states.dart';

import '../../../../../Core/domain/models/specie_model.dart';
import '../../../../../Core/errors/failures/specie/specie_failure.dart';
import '../../../domain/usecases/get_specie_usecase.dart';
import 'specie_event.dart';
import 'specie_state.dart';

class SpecieBloc extends Bloc<SpecieEvent, AppState> with Disposable {
  final GetSpeciesUseCase _usecase;

  SpecieBloc(this._usecase) : super(InitialState()) {
    on<FetchSpecies>(_onFetch);
  }

  List<Specie> species = [];

  void _onFetch(FetchSpecies event, Emitter<AppState> emit) async {
    emit(GettingAllSpeciesState());
    final result = await _usecase(event.specieUrl);
    emit(
      result.fold(
        (failure) {
          switch (failure.runtimeType) {
            case NoSpeciesFoundFailure:
              return ZeroSpeciesToShowState();
            default:
              return UnableToGetSpeciesState();
          }
        },
        (success) {
          species = success;
          return SuccessfullyGotAllSpeciesState();
        },
      ),
    );
  }

  @override
  void dispose() => close();
}
