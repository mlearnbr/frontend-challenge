import 'package:challenge/Core/domain/models/planet_model.dart';
import 'package:challenge/Modules/homePage/presentation/controller/film_bloc/film_bloc.dart';
import 'package:challenge/Modules/homePage/presentation/controller/home_bloc/home_people_bloc.dart';
import 'package:challenge/Modules/homePage/presentation/controller/planet_bloc/planet_bloc.dart';
import 'package:challenge/Modules/homePage/presentation/controller/species_bloc/specie_bloc.dart';
import 'package:challenge/Modules/homePage/presentation/pages/detail_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/remote_datasource/HomeWorld/planet_remote_datasource.dart';
import 'data/remote_datasource/film/film_remote_datasource.dart';
import 'data/remote_datasource/people/people_remote_datasource.dart';

import 'data/remote_datasource/specie/specie_remote_datasource.dart';
import 'data/repositoriesImpl/film/film_repository_impl.dart';
import 'data/repositoriesImpl/people/people_repository_impl.dart';

import 'data/repositoriesImpl/planet/planet_repository_impl.dart';
import 'data/repositoriesImpl/specie/specie_repository_impl.dart';
import 'domain/usecases/get_film_usecase.dart';
import 'domain/usecases/get_peoples_usecase.dart';
import 'domain/usecases/get_planet_usecase.dart';
import 'domain/usecases/get_specie_usecase.dart';
import 'presentation/pages/home_page.dart';

class HomePageModule extends Module {
  @override
  List<Bind> get binds => [
        //Planet
        Bind((i) => PlanetRemoteDataSourceImplementation(i())),
        Bind((i) => PlanetRepositoryImplementation(remoteDatasource: i())),
        Bind((i) => GetPlanetUseCase(planetRepository: i())),
        Bind<PlanetBloc>(
          (i) => PlanetBloc(i()),
          onDispose: (bloc) => bloc.close(),
        ),
        //Specie
        Bind((i) => SpecieRemoteDataSourceImplementation(i())),
        Bind((i) => SpecieRepositoryImplementation(remoteDatasource: i())),
        Bind((i) => GetSpeciesUseCase(specieRepository: i())),
        Bind<SpecieBloc>(
          (i) => SpecieBloc(i()),
          onDispose: (bloc) => bloc.close(),
        ),
        // Film
        Bind((i) => FilmRemoteDataSourceImplementation(i())),
        Bind((i) => FilmRepositoryImplementation(remoteDatasource: i())),
        Bind((i) => GetFilmUseCase(filmRepository: i())),
        Bind<FilmBloc>(
          (i) => FilmBloc(i()),
          onDispose: (bloc) => bloc.close(),
        ),
        //People
        Bind((i) => PeopleRemoteDataSourceImplementation(i())),
        Bind((i) => PeopleRepositoryImplementation(remoteDatasource: i())),
        Bind((i) => GetPeoplesUseCase(peopleRepository: i())),
        Bind<HomeBloc>(
          (i) => HomeBloc(i()),
          onDispose: (bloc) => bloc.close(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/detailPage', child: (context, args) {
          final people = args.data['people'];
          return PeopleDetailsPage(
            people: people,
          );
        }),
      ];
}
