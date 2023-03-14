import 'package:challenge/Core/data/http/http.dart';
import 'package:challenge/Core/enums/methods_enum.dart';
import 'package:challenge/Core/data/mappers/people/people_mapper.dart';

import '../../../../Core/domain/models/people_model.dart';

abstract class PeopleRemoteDatasource {
  Future<List<People>> getPeoples();
}

class PeopleRemoteDataSourceImplementation implements PeopleRemoteDatasource {
  final HttpClient httpClient;

  PeopleRemoteDataSourceImplementation(this.httpClient);
  @override
  Future<List<People>> getPeoples() async {
    // List<Film> filmList = [];
    try {
      final response = await httpClient.request(
          url: 'https://swapi.dev/api/people', method: MethodEnum.get);

      final List<People> peopleList = List.from(
        response["results"].map(
          (people) {
            return PeopleMapper.fromMap(people);
          },
        ),
      );
      // for (var people in peopleList) {
      //   var peopleFilms = people.films;
      //   if (peopleFilms != null) {
      //     for (var filmUrl in peopleFilms) {
      //       var film = await filmRemoteDatasource.getFilm(filmUrl);
      //       filmList.add(film);
      //     }
      //     people.filmObject = filmList;
      //     filmList = [];
      //   }
      // }

      return peopleList;
    } on HttpError {
      rethrow;
    }
  }
}
