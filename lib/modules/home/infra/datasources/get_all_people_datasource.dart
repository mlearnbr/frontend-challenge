import '../models/people_model.dart';

abstract class GetAllPeopleDatasource {
  Future<List<PeopleModel>> call();
}
