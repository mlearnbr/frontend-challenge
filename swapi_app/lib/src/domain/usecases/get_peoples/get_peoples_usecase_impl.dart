import 'package:swapi_app/src/domain/repositories/peoples_repository.dart';
import 'package:swapi_app/src/domain/entities/response/peoples_response.dart';
import 'package:swapi_app/src/domain/usecases/get_peoples/get_peoples_usecase.dart';

class GetPeoplesUseCaseImpl implements GetPeoplesUseCase {
  final PeoplesRepository repository;
  GetPeoplesUseCaseImpl({
    required this.repository,
  });

  @override
  Future<PeoplesResponse> call({
    int page = 1,
  }) async {
    return await repository.getPeoples(
      page: page,
    );
  }
}
