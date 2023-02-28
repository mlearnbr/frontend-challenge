import 'dart:convert';

import 'package:star_wars/modules/home/external/mapper/people_model_mapper.dart';

import '../../../core/rest/rest_response.dart';
import '../../../core/rest/rest_service.dart';
import '../../domain/failures/home_failures.dart';
import '../../infra/datasources/get_all_people_datasource.dart';
import '../../infra/models/film_model.dart';
import '../../infra/models/people_model.dart';
import '../../infra/models/specie_model.dart';
import '../mapper/film_model_mapper.dart';
import '../mapper/specie_model_mapper.dart';

class GetAllPeopleDatasourceImpl implements GetAllPeopleDatasource {
  final RestService _restService;
  final FelmModelMapper _felmModelMapper;
  final SpecieModelMapper _specieModelMapper;
  final PeopleModelMapper _peopleModelMapper;

  GetAllPeopleDatasourceImpl({
    required RestService restService,
    required FelmModelMapper felmModelMapper,
    required SpecieModelMapper specieModelMapper,
    required PeopleModelMapper peopleModelMapper,
  })  : _restService = restService,
        _felmModelMapper = felmModelMapper,
        _specieModelMapper = specieModelMapper,
        _peopleModelMapper = peopleModelMapper;

  @override
  Future<List<PeopleModel>> call() async {
    final RestResponse<String> restResponse = await _restService.get(
      'https://swapi.dev/api/people',
    );

    if (restResponse.statusCode == 200) {
      final data = restResponse.data;

      if (data == null || data.isEmpty) {
        return [];
      }

      List<PeopleModel> listPeopleModel = [];
      final Map<String, dynamic> resultMapData = json.decode(data);
      final List listPeopleMap = resultMapData['results'];

      for (var peopleMap in listPeopleMap) {
        PeopleModel peoplesModel;

        peoplesModel = _peopleModelMapper.fromJson(peopleMap);

        final List listPeopleFilms = peopleMap['films'];
        List<FilmModel> films = [];
        if (listPeopleFilms.isNotEmpty) {
          films = await getFilms(films: peopleMap['films']);
        }

        final List listPeoplEspecies = peopleMap['species'];
        List<SpecieModel> species = [];
        if (listPeoplEspecies.isNotEmpty) {
          species = await getSpecies(species: peopleMap['species']);
        }

        peoplesModel.films = films;
        peoplesModel.species = species;

        listPeopleModel.add(peoplesModel);
      }

      return listPeopleModel;
    }

    throw const PeopleDatasourceFailure();
  }

  Future<List<FilmModel>> getFilms({
    required List films,
  }) async {
    final resultRestResponse = await Future.wait<RestResponse<String>>(
      films.map((e) {
        return _restService.get(
          e,
        );
      }).toList(),
    );

    List<FilmModel> listfilms = [];

    for (var element in resultRestResponse) {
      if (element.statusCode == 200) {
        final data = element.data;

        if (data == null || data.isEmpty) {
          break;
        }

        final Map<String, dynamic> filmMapData = json.decode(data);

        final filmMap = _felmModelMapper.fromJson(filmMapData);

        listfilms.add(filmMap);
      }
    }

    return listfilms;
  }

  Future<List<SpecieModel>> getSpecies({
    required List species,
  }) async {
    final resultRestResponse = await Future.wait<RestResponse<String>>(
      species.map((e) {
        return _restService.get(
          e,
        );
      }).toList(),
    );

    List<SpecieModel> listSpecies = [];

    for (var element in resultRestResponse) {
      if (element.statusCode == 200) {
        final data = element.data;

        if (data == null || data.isEmpty) {
          break;
        }

        final Map<String, dynamic> specieMapData = json.decode(data);
        final listSpeciesMap = _specieModelMapper.fromJson(specieMapData);

        listSpecies.add(listSpeciesMap);
      }
    }

    return listSpecies;
  }
}
