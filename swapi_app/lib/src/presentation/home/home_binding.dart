import 'package:get/get.dart';
import 'package:swapi_app/shared/services/http_manager.dart';
import 'package:swapi_app/src/data/datasources/remote/peoples_remote_data_source.dart';
import 'package:swapi_app/src/data/datasources/remote/peoples_remote_data_source_impl.dart';
import 'package:swapi_app/src/data/repositories/peoples_repository_impl.dart';
import 'package:swapi_app/src/domain/repositories/peoples_repository.dart';
import 'package:swapi_app/src/domain/usecases/get_peoples/get_peoples_usecase.dart';
import 'package:swapi_app/src/domain/usecases/get_peoples/get_peoples_usecase_impl.dart';
import 'package:swapi_app/src/presentation/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeoplesRemoteDataSource>(
      () => PeoplesRemoteDataSourceImpl(
        manager: Get.find<HttpManager>(),
      ),
    );
    Get.lazyPut<PeoplesRepository>(
      () => PeoplesRepositoryImpl(
        peoplesRemoteDataSource: Get.find<PeoplesRemoteDataSource>(),
      ),
    );
    Get.lazyPut<GetPeoplesUseCase>(
      () => GetPeoplesUseCaseImpl(
        repository: Get.find<PeoplesRepository>(),
      ),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(
        getPeoplesUseCase: Get.find<GetPeoplesUseCase>(),
      ),
    );
  }
}
