import 'package:equatable/equatable.dart';

abstract class FilmEvent extends Equatable {
  const FilmEvent();
  @override
  List<Object> get props => [];
}

class FetchFilms extends FilmEvent {
  final List<String> filmUrl;
  const FetchFilms(this.filmUrl);
}
