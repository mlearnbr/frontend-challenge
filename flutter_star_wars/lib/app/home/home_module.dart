import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/get_films_usecase.dart';
import 'domain/usecases/get_people_usecase.dart';
import 'domain/usecases/get_species_usecase.dart';
import 'external/http/http_get_films.dart';
import 'external/http/http_get_people.dart';
import 'external/http/http_get_species.dart';
import 'infra/repositiories/get_films_repository_impl.dart';
import 'infra/repositiories/get_people_repository_impl.dart';
import 'infra/repositiories/get_species_repository_impl.dart';
import 'presenter/home_page.dart';
import 'presenter/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // Get People Usecase
    Bind.lazySingleton((i) => HttpGetPeople()),
    Bind.lazySingleton((i) => GetPeopleRepositoryImpl(i())),
    Bind.lazySingleton((i) => GetPeopleUsecase(i())),

    // Get Species Usecase
    Bind.lazySingleton((i) => HttpGetSpecies()),
    Bind.lazySingleton((i) => GetSpeciesRepositoryImpl(i())),
    Bind.lazySingleton((i) => GetSpeciesUsecase(i())),

    // Get Films Usecase
    Bind.lazySingleton((i) => HttpGetFilms()),
    Bind.lazySingleton((i) => GetFilmsRepositoryImpl(i())),
    Bind.lazySingleton((i) => GetFilmsUsecase(i())),

    Bind.lazySingleton((i) => HomeStore(i(), i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
