import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../modules/core/rest/dio_rest_service.dart';
import '../modules/core/rest/rest_service.dart';
import '../modules/home/domain/repositories/get_all_people_repository.dart';
import '../modules/home/domain/usecases/get_all_people_usecase.dart';
import '../modules/home/domain/usecases/get_all_people_usecase_impl.dart';
import '../modules/home/external/datasources/get_all_people_datasource.dart';
import '../modules/home/external/mapper/film_model_mapper.dart';
import '../modules/home/external/mapper/people_model_mapper.dart';
import '../modules/home/external/mapper/specie_model_mapper.dart';
import '../modules/home/infra/adapters/film_entity_adapter.dart';
import '../modules/home/infra/adapters/people_entity_adapter.dart';
import '../modules/home/infra/adapters/specie_entity_adapter.dart';
import '../modules/home/infra/datasources/get_all_people_datasource.dart';
import '../modules/home/infra/repositories/get_all_people_repository_impl.dart';
import '../modules/home/presenter/controller/home_controller.dart';
import '../modules/home/presenter/home_screen.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<RestService>((i) {
          return DioRestService(
            dio: Dio(),
          );
        }),
        Bind.singleton<FelmModelMapper>((i) {
          return FelmModelMapper();
        }),
        Bind.singleton<SpecieModelMapper>((i) {
          return SpecieModelMapper();
        }),
        Bind.singleton<PeopleModelMapper>((i) {
          return PeopleModelMapper();
        }),
        Bind.singleton<GetAllPeopleDatasource>((i) {
          return GetAllPeopleDatasourceImpl(
            restService: i.get(),
            felmModelMapper: i.get(),
            peopleModelMapper: i.get(),
            specieModelMapper: i.get(),
          );
        }),
        Bind.singleton<FilmEntityAdapter>((i) {
          return FilmEntityAdapter();
        }),
        Bind.singleton<SpecieEntityAdapter>((i) {
          return SpecieEntityAdapter();
        }),
        Bind.singleton<PeopleEntityAdapter>((i) {
          return PeopleEntityAdapter(
            filmEntityAdapter: i.get(),
            specieEntityAdapter: i.get(),
          );
        }),
        Bind.singleton<GetAllPeopleDatasource>((i) {
          return GetAllPeopleDatasourceImpl(
            restService: i.get(),
            felmModelMapper: i.get(),
            peopleModelMapper: i.get(),
            specieModelMapper: i.get(),
          );
        }),
        Bind.singleton<GetAllPeopleRepository>((i) {
          return GetAllPeopleRepositoryImpl(
            getAllPeopleDatasource: i.get(),
            peopleEntityAdapter: i.get(),
          );
        }),
        Bind.singleton<GetAllPeopleUsecase>((i) {
          return GetAllPeopleUsecaseImpl(
            getAllPeopleRepository: i.get(),
          );
        }),
        Bind.singleton<HomeController>((i) {
          return HomeController(
            getAllPeopleUsecase: i.get(),
          );
        }),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => HomeScreen(
                  homeController: Modular.get<HomeController>(),
                )),
      ];
}
