import 'package:swapi_app/shared/errors/failure.dart';
import 'package:swapi_app/shared/services/http_manager.dart';
import 'package:swapi_app/src/data/datasources/remote/specie/specie_remote_data_source.dart';
import 'package:swapi_app/src/data/dtos/specie_dto.dart';

class SpecieRemoteDataSourceImpl extends SpecieRemoteDataSource {
  final HttpManager manager;
  SpecieRemoteDataSourceImpl({
    required this.manager,
  });

  @override
  Future<SpecieDto> getSpecieByUrl({required String url}) async {
    final response = await manager.restRequest(
      url: url,
      method: HttpMethods.get,
      queryParameters: {
        'format': 'json',
      },
    );
    if (!response.containsKey("message")) {
      return SpecieDto.fromMap(response);
    }
    throw Failure.fromMap(response);
  }
}
