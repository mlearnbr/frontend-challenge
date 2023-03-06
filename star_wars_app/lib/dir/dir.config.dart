// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:star_wars_app/data/data_sources/character/character_data_source.dart'
    as _i3;
import 'package:star_wars_app/data/data_sources/people/people_data_source.dart'
    as _i6;
import 'package:star_wars_app/data/data_sources/specie/specie_data_source.dart'
    as _i8;
import 'package:star_wars_app/data/repositories/character_repository.dart'
    as _i4;
import 'package:star_wars_app/data/repositories/people_repository.dart' as _i7;
import 'package:star_wars_app/data/use_cases/character/get_character.dart'
    as _i5;
import 'package:star_wars_app/data/use_cases/people/get_characters_from_people_list.dart'
    as _i9;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.CharacterDataSource>(() => _i3.CharacterDataSource());
  gh.factory<_i4.CharacterRepository>(
      () => _i4.CharacterRepository(gh<_i3.CharacterDataSource>()));
  gh.singleton<_i5.GetCharacter>(
      _i5.GetCharacter(gh<_i4.CharacterRepository>()));
  gh.factory<_i6.PeopleDataSource>(() => _i6.PeopleDataSource());
  gh.factory<_i7.PeopleRepository>(
      () => _i7.PeopleRepository(gh<_i6.PeopleDataSource>()));
  gh.factory<_i8.SpecieDataSource>(() => _i8.SpecieDataSource());
  gh.singleton<_i9.GetPeople>(_i9.GetPeople(gh<_i7.PeopleRepository>()));
  return getIt;
}
