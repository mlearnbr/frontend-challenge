import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars_db/core/util/logger.dart';
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
        emit(CharacterLoadingState());
        final characters = await listCharacters();
        emit(CharacterLoadedState(characters: characters));
      } catch (e) {
        Logger.log(e);
        emit(CharacterErrorState());
      }
    });
  }
}
