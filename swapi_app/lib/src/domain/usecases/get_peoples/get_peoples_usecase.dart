import 'package:swapi_app/src/domain/entities/response/peoples_response.dart';

abstract class GetPeoplesUseCase {
  Future<PeoplesResponse> call({
    int page = 1,
  });
}
