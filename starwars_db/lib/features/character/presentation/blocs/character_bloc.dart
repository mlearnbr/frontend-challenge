import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars_db/features/character/domain/entities/character.dart';
import 'package:starwars_db/features/character/domain/use_cases/list_characters_usecase.dart';

part 'character_event.dart';

part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final ListCharactersUsecase listCharacters;

  CharacterBloc({
    required this.listCharacters,
  }) : super(CharacterInitialState()) {
    on<ListCharactersEvent>((event, emit) async {
      try {
        final characters = await listCharacters();
        emit(CharacterLoadedState(characters: characters));
      } catch (e) {
        // TODO remove print and add a logger to avoid print in prod builds
        print(e);
        emit(CharacterErrorState());
      }
    });
  }
}
