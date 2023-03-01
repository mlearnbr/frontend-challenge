import '../entities/people_entity.dart';
import '../failures/home_failures.dart';
import '../repositories/get_all_people_repository.dart';
import 'get_all_people_usecase.dart';

class GetAllPeopleUsecaseImpl implements GetAllPeopleUsecase {
  final GetAllPeopleRepository _getAllPeopleRepository;

  GetAllPeopleUsecaseImpl(
      {required GetAllPeopleRepository getAllPeopleRepository})
      : _getAllPeopleRepository = getAllPeopleRepository;

  @override
  Future<List<PeopleEntity>> call() async {
    try {
      final listPeopleEntity = await _getAllPeopleRepository.call();

      return listPeopleEntity;
    } on PeopleDatasourceFailure {
      throw const PeopleUsecaseFailure(message: 'Erro ao tentar buscar dados');
    } catch (error, stackTrace) {
      throw PeopleUsecaseFailure(
        message: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
