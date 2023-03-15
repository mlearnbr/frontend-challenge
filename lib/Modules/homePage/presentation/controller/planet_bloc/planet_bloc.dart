import 'package:bloc/bloc.dart';
import 'package:challenge/Core/domain/models/planet_model.dart';
import 'package:challenge/Modules/homePage/presentation/controller/planet_bloc/planet_event.dart';
import 'package:challenge/Modules/homePage/presentation/controller/planet_bloc/planet_state.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../Core/baseStates/base_states.dart';
import '../../../../../Core/domain/models/film_model.dart';
import '../../../../../Core/errors/failures/homeworld/planet_failures.dart';
import '../../../domain/usecases/get_planet_usecase.dart';

class PlanetBloc extends Bloc<PlanetEvent, AppState> with Disposable {
  final GetPlanetUseCase _usecase;

  PlanetBloc(this._usecase) : super(InitialState()) {
    on<FetchPlanet>(_onFetch);
  }

  Planet planet = Planet('');

  void _onFetch(FetchPlanet event, Emitter<AppState> emit) async {
    emit(GettingPlanetState());
    final result = await _usecase(event.planetUrl);
    emit(
      result.fold(
        (failure) {
          switch (failure.runtimeType) {
            case NoPlanetFoundFailure:
              return ZeroPlanetsToShowState();
            default:
              return UnableToGetPlanetState();
          }
        },
        (success) {
          planet = success;
          return SuccessfullyGotPlanetState();
        },
      ),
    );
  }

  @override
  void dispose() => close();
}
