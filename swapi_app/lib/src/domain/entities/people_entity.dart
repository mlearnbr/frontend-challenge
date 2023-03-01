class PeopleEntity {
  final String name;
  final String? birthYear;

  PeopleEntity({
    required this.name,
    this.birthYear,
  });

  /* factory PeopleEntity.fromMap(Map<String, dynamic> map) => PeopleEntity(
        name: map['name'],
        birthYear: map['birth_year'],
      );*/

  List<Object?> get props => [name, birthYear];
}
