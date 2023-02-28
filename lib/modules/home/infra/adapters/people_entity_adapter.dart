import '../../domain/entities/film_entity.dart';
import '../../domain/entities/people_entity.dart';
import '../../domain/entities/specie_entity.dart';
import '../models/people_model.dart';
import 'film_entity_adapter.dart';
import 'specie_entity_adapter.dart';

class PeopleEntityAdapter {
  final FilmEntityAdapter _filmEntityAdapter;
  final SpecieEntityAdapter _specieEntityAdapter;

  const PeopleEntityAdapter({
    required FilmEntityAdapter filmEntityAdapter,
    required SpecieEntityAdapter specieEntityAdapter,
  })  : _filmEntityAdapter = filmEntityAdapter,
        _specieEntityAdapter = specieEntityAdapter;

  PeopleEntity fromModel({
    required PeopleModel peopleModel,
  }) {
    return PeopleEntity(
      name: peopleModel.name,
      height: peopleModel.height,
      mass: peopleModel.mass,
      hairColor: peopleModel.hairColor,
      skinColor: peopleModel.skinColor,
      eyeColor: peopleModel.eyeColor,
      birthYear: peopleModel.birthYear,
      gender: peopleModel.gender,
      homeworld: peopleModel.homeworld,
      films: peopleModel.films.map<FilmEntity>((filmModel) {
        return _filmEntityAdapter.fromModel(filmModel: filmModel);
      }).toList(),
      species: peopleModel.species.map<SpecieEntity>((specieModel) {
        return _specieEntityAdapter.fromModel(specieModel: specieModel);
      }).toList(),
    );
  }
}
