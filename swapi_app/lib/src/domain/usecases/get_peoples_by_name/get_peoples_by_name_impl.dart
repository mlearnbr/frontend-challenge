import 'package:swapi_app/src/domain/repositories/peoples_repository.dart';
import 'package:swapi_app/src/domain/entities/response/peoples_response.dart';
import 'package:swapi_app/src/domain/usecases/get_peoples_by_name/get_peoples_by_name.dart';

class GetPeoplesByNameUseCaseImpl implements GetPeoplesByNameUseCase {
  final PeoplesRepository repository;
  GetPeoplesByNameUseCaseImpl({
    required this.repository,
  });

  @override
  Future<PeoplesResponse> call({
    int page = 1,
    required String name,
  }) async {
    return await repository.getPeoplesByName(
      page: page,
      name: name,
    );
  }
}
