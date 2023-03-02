import 'package:swapi_app/src/domain/entities/people_entity.dart';

class PeoplesResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<PeopleEntity> result;

  PeoplesResponse({
    required this.count,
    this.next,
    this.previous,
    required this.result,
  });

  /*factory PeoplesResponse.fromJson(Map<String, dynamic> map) => PeoplesResponse(
        count: map['count'],
        next: map['next'],
        previous: map['previous'],
        result: List<Map<String, dynamic>>.from(map['results'])
            .map((e) => PeopleEntity.fromMap(e))
            .toList(),
      );*/
}
