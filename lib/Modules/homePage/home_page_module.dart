import 'package:animations/animations.dart';
import 'package:challenge/Modules/homePage/presentation/controller/bill_bloc/home_people_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../characterDetailPage/character_detail_page_moduler.dart';
import 'data/remote_datasource/people_remote_datasource.dart';
import 'data/repositoriesImpl/people_repository_impl.dart';
import 'domain/usecases/get_peoples_usecase.dart';
import 'presentation/pages/home_page.dart';

class HomePageModule extends Module {
  @override
  List<Bind> get binds => [
        //People
        Bind((i) => PeopleRemoteDataSourceImplementation(i())),
        Bind((i) => PeopleRepositoryImplementation(remoteDatasource: i())),
        Bind((i) => GetPeoplesUseCase(peopleRepository: i())),
        Bind<HomePeopleBloc>(
          (i) => HomePeopleBloc(i()),
          onDispose: (bloc) => bloc.close(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ModuleRoute(
          '/detailPage',
          module: CharacterDetailPageModule(),
          transition: TransitionType.custom,
          customTransition: CustomTransition(
            transitionDuration: const Duration(milliseconds: 400),
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
          ),
        ),
      ];
}
