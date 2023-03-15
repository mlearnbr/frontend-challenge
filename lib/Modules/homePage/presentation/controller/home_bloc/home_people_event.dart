import 'package:equatable/equatable.dart';

abstract class HomePeopleEvent extends Equatable {
  const HomePeopleEvent();
  @override
  List<Object> get props => [];
}

class FetchPeoples extends HomePeopleEvent {
  const FetchPeoples();
}
