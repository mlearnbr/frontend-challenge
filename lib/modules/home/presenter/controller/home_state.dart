import '../../domain/entities/people_entity.dart';

abstract class HomeState {
  InitialHomeState initialHomeState() {
    return InitialHomeState();
  }

  LoadingHomeState loadingHomeState() {
    return LoadingHomeState();
  }

  LoadedHomeState loadedHomeState({
    required List<PeopleEntity> listPeople,
  }) {
    return LoadedHomeState(
      listPeople: listPeople,
    );
  }

  ErrorHomeState errorLoginState({
    required String message,
  }) {
    return ErrorHomeState(message: message);
  }
}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class LoadedHomeState extends HomeState {
  final List<PeopleEntity> listPeople;

  LoadedHomeState({
    required this.listPeople,
  });
}

class ErrorHomeState extends HomeState {
  final String message;

  ErrorHomeState({
    required this.message,
  });
}
