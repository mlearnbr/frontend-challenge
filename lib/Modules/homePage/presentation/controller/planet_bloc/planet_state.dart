import '../../../../../../../Core/baseStates/base_states.dart';

class GettingPlanetState implements ProcessingState {}

class SuccessfullyGotPlanetState implements SuccessState {}

class UnableToGetPlanetState implements ErrorState {}

class ZeroPlanetsToShowState implements ErrorState {}
