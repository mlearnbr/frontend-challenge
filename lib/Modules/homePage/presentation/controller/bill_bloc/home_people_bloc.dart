import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../Core/baseStates/base_states.dart';
import '../../../../../Core/errors/failures/people/people_failures.dart';
import '../../../../../Core/domain/models/people_model.dart';
import '../../../domain/usecases/get_peoples_usecase.dart';
import 'home_people_event.dart';
import 'home_people_state.dart';
import 'package:bloc/bloc.dart';

class HomePeopleBloc extends Bloc<HomePeopleEvent, AppState> with Disposable {
  final GetPeoplesUseCase _usecase;

  HomePeopleBloc(this._usecase) : super(InitialState()) {
    on<FetchPeoples>(_onFetch);
  }

  List<People> peoples = [];

  void _onFetch(FetchPeoples event, Emitter<AppState> emit) async {
    emit(GettingAllPeoplesState());

    final result = await _usecase();

    emit(
      result.fold(
        (failure) {
          switch (failure.runtimeType) {
            case NoPeoplesFoundFailure:
              return ZeroPeoplesToShowState();
            default:
              return UnableToGetPeoplesState();
          }
        },
        (success) {
          peoples = success;
          return SuccessfullyGotAllPeoplesState();
        },
      ),
    );
  }

  @override
  void dispose() => close();
}
