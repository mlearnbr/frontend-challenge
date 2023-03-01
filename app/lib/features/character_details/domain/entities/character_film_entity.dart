import 'package:equatable/equatable.dart';

class CharacterFilmEntity extends Equatable {
  final String title;

  const CharacterFilmEntity({
    required this.title,
  });

  @override
  List<Object?> get props => [title];
}
