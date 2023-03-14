import 'package:challenge/Modules/characterDetailPage/presentation/pages/detail_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/remote_datasource/film/film_remote_datasource.dart';
import 'data/remote_datasource/specie/specie_remote_datasource.dart';
import 'data/repositoriesImpl/film/film_repository_impl.dart';
import 'data/repositoriesImpl/specie/specie_repository_impl.dart';

class CharacterDetailPageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => FilmRemoteDataSourceImplementation(i())),
        Bind((i) => FilmRepositoryImplementation(remoteDatasource: i())),
        Bind((i) => SpecieRemoteDataSourceImplementation(i())),
        Bind((i) => SpecieRepositoryImplementation(remoteDatasource: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const PeopleDetailsPage()),
      ];
}
