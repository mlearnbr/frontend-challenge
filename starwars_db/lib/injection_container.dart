import 'package:get_it/get_it.dart';
import 'package:starwars_db/features/character/data/data_sources/character_remote_data_source.dart';
import 'package:starwars_db/features/character/data/repositories/character_repository_impl.dart';
import 'package:starwars_db/features/character/domain/repositories/character_repository.dart';
import 'package:starwars_db/features/character/domain/use_cases/list_characters_usecase.dart';
import 'package:starwars_db/features/character/presentation/blocs/character_bloc.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> setup() async {
  // Blocs
  getIt.registerFactory(() => CharacterBloc(listCharacters: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => ListCharactersUsecase(getIt()));

  // Repositories
  getIt.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(remoteDataSource: getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSource(client: getIt()),
  );

  // Extras
  getIt.registerLazySingleton(() => http.Client());
}
