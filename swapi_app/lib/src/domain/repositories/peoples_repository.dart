import 'package:swapi_app/src/domain/entities/response/peoples_response.dart';

abstract class PeoplesRepository {
  Future<PeoplesResponse> getPeoples({
    int page = 1,
  });
}
