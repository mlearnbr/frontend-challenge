import '../../../../../Core/data/http/http_client.dart';
import '../../../../../Core/data/http/http_error.dart';
import '../../../../../Core/data/mappers/specie/specie_mapper.dart';
import '../../../../../Core/enums/methods_enum.dart';

import '../../../../../Core/domain/models/specie_model.dart';

abstract class SpecieRemoteDatasource {
  Future<List<Specie>> getSpecies(List<String> specieUrl);
}

class SpecieRemoteDataSourceImplementation implements SpecieRemoteDatasource {
  final HttpClient httpClient;

  SpecieRemoteDataSourceImplementation(this.httpClient);
  @override
  Future<List<Specie>> getSpecies(List<String> specieUrl) async {
    List<Specie> specieList = [];
    try {
      for (var url in specieUrl) {
        var specie = await httpClient.request(url: url, method: MethodEnum.get);
        final mappedFilm = SpecieMapper.fromMap(specie);
        specieList.add(mappedFilm);
      }

      return specieList;
    } on HttpError {
      rethrow;
    }
  }
}
