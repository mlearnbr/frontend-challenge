import 'package:mobx/mobx.dart';
import 'package:star_wars/modules/home/domain/usecases/get_all_people_usecase.dart';
import '../controller/home_state.dart';

part 'home_controller.g.dart';

// ignore: library_private_types_in_public_api
class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final GetAllPeopleUsecase _getAllPeopleUsecase;

  _HomeController({
    required GetAllPeopleUsecase getAllPeopleUsecase,
  }) : _getAllPeopleUsecase = getAllPeopleUsecase;

  @observable
  HomeState state = InitialHomeState();

  @action
  Future<void> getAllPeople() async {
    try {
      state = state.loadingHomeState();

      final resultList = await _getAllPeopleUsecase.call();

      state = state.loadedHomeState(
        listPeople: resultList,
      );
    } catch (e) {
      state = state.errorLoginState(
        message: e.toString(),
      );
    }
  }
}
