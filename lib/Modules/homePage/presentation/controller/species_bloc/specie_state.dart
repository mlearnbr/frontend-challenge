import '../../../../../../../Core/baseStates/base_states.dart';

class GettingAllSpeciesState implements ProcessingState {}

class SuccessfullyGotAllSpeciesState implements SuccessState {}

class UnableToGetSpeciesState implements ErrorState {}

class ZeroSpeciesToShowState implements ErrorState {}
