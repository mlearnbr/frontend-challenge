import '../entities/people_entity.dart';

abstract class GetAllPeopleUsecase {
  Future<List<PeopleEntity>> call();
}
