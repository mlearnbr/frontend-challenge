import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:star_wars/modules/core/rest/dio_rest_service.dart';
import 'package:star_wars/modules/home/external/datasources/get_all_people_datasource.dart';
import 'package:star_wars/modules/home/external/mapper/film_model_mapper.dart';
import 'package:star_wars/modules/home/external/mapper/people_model_mapper.dart';
import 'package:star_wars/modules/home/external/mapper/specie_model_mapper.dart';
import 'package:star_wars/modules/home/infra/datasources/get_all_people_datasource.dart';

void main() {
  late final GetAllPeopleDatasource getAllPeopleDatasource;

  setUpAll(() {
    getAllPeopleDatasource = GetAllPeopleDatasourceImpl(
      restService: DioRestService(
        dio: Dio(),
      ),
      felmModelMapper: FelmModelMapper(),
      peopleModelMapper: PeopleModelMapper(),
      specieModelMapper: SpecieModelMapper(),
    );
  });
  test('Testar o repositório de dados', () async {
    await getAllPeopleDatasource.call();
  });
}
