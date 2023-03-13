abstract class AppState {}

abstract class SuccessState extends AppState {}

abstract class ErrorState extends AppState {}

abstract class ProcessingState extends AppState {}

class InitialState implements AppState {}

abstract class UserInputErrorState extends ErrorState {}
