import 'package:star_wars_app/app/shared/helpers/const_films.dart';

String getFilmsPerson(List<dynamic> list) {
  if (list.isEmpty) {
    return '';
  }
  var films = list.map<String>((e) {
    if (e.contains('1')) {
      return listFilms[1];
    }

    if (e.contains('2')) {
      return listFilms[2];
    }

    if (e.contains('3')) {
      return listFilms[3];
    }

    if (e.contains('4')) {
      return listFilms[4];
    }

    if (e.contains('5')) {
      return listFilms[5];
    }

    if (e.contains('6')) {
      return listFilms[6];
    } else {
      return '';
    }
  }).toList();

  return films.toString().replaceFirst('[', '').replaceAll(']', '');
}
