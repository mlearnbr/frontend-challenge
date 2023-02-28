import 'package:equatable/equatable.dart';

class FilmEntity extends Equatable {
  final String title;

  const FilmEntity({
    required this.title,
  });

  @override
  List<Object?> get props => [title];
}
