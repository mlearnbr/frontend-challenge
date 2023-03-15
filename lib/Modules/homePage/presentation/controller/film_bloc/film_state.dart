import '../../../../../../../Core/baseStates/base_states.dart';

class GettingAllFilmsState implements ProcessingState {}

class SuccessfullyGotAllFilmsState implements SuccessState {}

class UnableToGetFilmsState implements ErrorState {}

class ZeroFilmsToShowState implements ErrorState {}
