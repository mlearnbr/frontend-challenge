import '../../../../../Core/data/http/http_client.dart';
import '../../../../../Core/data/http/http_error.dart';
import '../../../../../Core/data/mappers/specie/specie_mapper.dart';
import '../../../../../Core/enums/methods_enum.dart';

import '../../../../../Core/domain/models/specie_model.dart';

abstract class SpecieRemoteDatasource {
  Future<Specie> getSpecie(String specieUrl);
}

class SpecieRemoteDataSourceImplementation implements SpecieRemoteDatasource {
  final HttpClient httpClient;

  SpecieRemoteDataSourceImplementation(this.httpClient);
  @override
  Future<Specie> getSpecie(String specieUrl) async {
    try {
      final response =
          await httpClient.request(url: specieUrl, method: MethodEnum.get);
      return SpecieMapper.fromMap(response);
    } on HttpError {
      rethrow;
    }
  }
}
