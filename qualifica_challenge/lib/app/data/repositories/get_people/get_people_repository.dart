import '../../models/people_model.dart';

abstract class GetPeopleRepository {
  Future<List<PeopleModel>> getPeopleRepository();

  Future<List<PeopleModel>> getPeopleNextIdRepository(int nextId);

  Future<PeopleModel> getPeopleCatalogRepository(String url);
}
