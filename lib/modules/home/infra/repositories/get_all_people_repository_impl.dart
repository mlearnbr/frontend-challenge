import '../../domain/entities/people_entity.dart';
import '../../domain/failures/home_failures.dart';
import '../../domain/repositories/get_all_people_repository.dart';
import '../adapters/people_entity_adapter.dart';
import '../datasources/get_all_people_datasource.dart';

class GetAllPeopleRepositoryImpl implements GetAllPeopleRepository {
  final GetAllPeopleDatasource _getAllPeopleDatasource;
  final PeopleEntityAdapter _peopleEntityAdapter;

  const GetAllPeopleRepositoryImpl({
    required GetAllPeopleDatasource getAllPeopleDatasource,
    required PeopleEntityAdapter peopleEntityAdapter,
  })  : _getAllPeopleDatasource = getAllPeopleDatasource,
        _peopleEntityAdapter = peopleEntityAdapter;

  @override
  Future<List<PeopleEntity>> call() async {
    try {
      final peopleAllModel = await _getAllPeopleDatasource.call();

      final peopleEntity = peopleAllModel.map((peopleModel) {
        return _peopleEntityAdapter.fromModel(
          peopleModel: peopleModel,
        );
      }).toList();

      return peopleEntity;
    } catch (e) {
      throw const PeopleDatasourceFailure(
        message: 'Erro ao tentar buscar pessoas',
      );
    }
  }
}
