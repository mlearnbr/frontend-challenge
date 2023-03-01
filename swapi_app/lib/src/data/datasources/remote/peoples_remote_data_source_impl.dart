import 'package:swapi_app/shared/errors/failure.dart';
import 'package:swapi_app/shared/services/http_manager.dart';
import 'package:swapi_app/src/data/datasources/remote/peoples_remote_data_source.dart';
import 'package:swapi_app/src/data/dtos/response/peoples_response_dto.dart';
import 'package:swapi_app/src/domain/entities/response/peoples_response.dart';

class PeoplesRemoteDataSourceImpl extends PeoplesRemoteDataSource {
  final String baseUrl = "https://swapi.dev/api/people";

  final HttpManager manager;
  PeoplesRemoteDataSourceImpl({
    required this.manager,
  });

  @override
  Future<PeoplesResponse> getPeoples({
    int page = 1,
  }) async {
    final response = await manager.restRequest(
      url: baseUrl,
      method: HttpMethods.get,
      queryParameters: {
        'page': page,
        'format': 'json',
      },
    );
    if (response.containsKey('results')) {
      return PeoplesResponseDto.fromJson(response);
    }
    throw Failure.fromMap(response);
  }
}
