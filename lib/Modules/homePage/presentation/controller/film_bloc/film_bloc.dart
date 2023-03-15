import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../Core/baseStates/base_states.dart';
import '../../../../../Core/domain/models/film_model.dart';
import '../../../../../Core/errors/failures/film/film_failure.dart';
import '../../../domain/usecases/get_film_usecase.dart';
import 'film_event.dart';
import 'film_state.dart';

class FilmBloc extends Bloc<FilmEvent, AppState> with Disposable {
  final GetFilmUseCase _usecase;

  FilmBloc(this._usecase) : super(InitialState()) {
    on<FetchFilms>(_onFetch);
  }

  List<Film> films = [];

  void _onFetch(FetchFilms event, Emitter<AppState> emit) async {
    emit(GettingAllFilmsState());
    final result = await _usecase(event.filmUrl);
    emit(
      result.fold(
        (failure) {
          switch (failure.runtimeType) {
            case NoFilmsFoundFailure:
              return ZeroFilmsToShowState();
            default:
              return UnableToGetFilmsState();
          }
        },
        (success) {
          films = success;
          return SuccessfullyGotAllFilmsState();
        },
      ),
    );
  }

  @override
  void dispose() => close();
}
