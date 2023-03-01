import 'package:swapi_app/src/data/dtos/people_dto.dart';
import 'package:swapi_app/src/domain/entities/response/peoples_response.dart';

class PeoplesResponseDto extends PeoplesResponse {
  PeoplesResponseDto({
    required int count,
    String? next,
    String? previous,
    required List<PeopleDto> result,
  }) : super(
          count: count,
          result: result,
          next: next,
          previous: previous,
        );

  factory PeoplesResponseDto.fromJson(Map<String, dynamic> map) =>
      PeoplesResponseDto(
        count: map['count'],
        next: map['next'],
        previous: map['previous'],
        result: List<Map<String, dynamic>>.from(map['results'])
            .map((e) => PeopleDto.fromMap(e))
            .toList(),
      );
}
