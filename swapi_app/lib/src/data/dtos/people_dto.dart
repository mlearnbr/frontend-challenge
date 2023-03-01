import 'package:swapi_app/src/domain/entities/people_entity.dart';

class PeopleDto extends PeopleEntity {
  PeopleDto({
    required String name,
    String? birthYear,
  }) : super(
          name: name,
          birthYear: birthYear,
        );

  factory PeopleDto.fromMap(Map<String, dynamic> map) => PeopleDto(
        name: map['name'],
        birthYear: map['birth_year'] == null || map['birth_year'] == 'unknown'
            ? null
            : map['birth_year'],
      );
}
