import 'package:flutter_application/features/character_details/domain/entities/film_entity.dart';

abstract class ICharacterDetailsController {
  Future<void> getCharacterFilmList(List<String> urls);
  bool get isLoading;
  bool get isLoadingMore;
  List<FilmEntity> get filmList;
}
