import 'package:flutter/material.dart';

class CharacterListItemWidget extends StatelessWidget {
  final String name;
  final String? specie;
  final String birthYear;

  const CharacterListItemWidget({
    super.key,
    required this.name,
    required this.specie,
    required this.birthYear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(),
          const SizedBox(height: 8),
          Text(name),
          const SizedBox(height: 4),
          Visibility(
            visible: specie != null,
            child: Text(
              specie ?? '',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: 4),
          Text(birthYear, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
