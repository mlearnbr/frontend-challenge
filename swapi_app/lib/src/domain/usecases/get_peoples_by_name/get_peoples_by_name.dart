import 'package:swapi_app/src/domain/entities/response/peoples_response.dart';

abstract class GetPeoplesByNameUseCase {
  Future<PeoplesResponse> call({
    int page = 1,
    required String name,
  });
}
