import '../entities/people_entity.dart';

abstract class GetAllPeopleRepository {
  Future<List<PeopleEntity>> call();
}
