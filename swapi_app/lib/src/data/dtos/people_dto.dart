import 'package:swapi_app/src/domain/entities/people_entity.dart';

class PeopleDto extends PeopleEntity {
  PeopleDto({
    required String name,
    String? birthYear,
  }) : super(
          name: name,
          birthYear: birthYear,
        );
}
