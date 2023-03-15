import '../../../../../../../Core/baseStates/base_states.dart';

class RefreshingAllPeoplesState implements ProcessingState {}

class GettingAllPeoplesState implements ProcessingState {}

class SuccessfullyGotAllPeoplesState implements SuccessState {}

class UnableToGetPeoplesState implements ErrorState {}

class ZeroPeoplesToShowState implements ErrorState {}
