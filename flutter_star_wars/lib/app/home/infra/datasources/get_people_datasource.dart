import 'package:flutter_star_wars/app/home/domain/entities/people_entity.dart';

abstract class GetPeopleDatasource {
  Future<List<PeopleEntity>> getPeople();
}