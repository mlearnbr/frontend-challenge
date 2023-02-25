import 'package:flutter_application/app/layers/domain/models/person_model.dart';

abstract class PersonsState {}

class PersonsSuccessState implements PersonsState {
  final List<PersonModel> data;

  PersonsSuccessState(this.data);
}

class PersonsErrorState implements PersonsState {
  final String errorMessage;
  final Object? error;

  PersonsErrorState(this.errorMessage, this.error);
}
