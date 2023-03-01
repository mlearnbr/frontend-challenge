import 'package:flutter_application/features/character_details/domain/entities/entities.dart';

abstract class ICharacterDetailsController {
  Future<void> getCharacterFilmList(List<String> urls);
  Future<void> getCharacterPlanet(String url);
  bool get isLoading;
  bool get isLoadingMore;
  List<FilmEntity> get filmList;
  PlanetEntity? get characterPlanet;
}
