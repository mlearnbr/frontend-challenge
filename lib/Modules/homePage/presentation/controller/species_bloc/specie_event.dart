import 'package:equatable/equatable.dart';

abstract class SpecieEvent extends Equatable {
  const SpecieEvent();
  @override
  List<Object> get props => [];
}

class FetchSpecies extends SpecieEvent {
  final List<String> specieUrl;
  const FetchSpecies(this.specieUrl);
}
