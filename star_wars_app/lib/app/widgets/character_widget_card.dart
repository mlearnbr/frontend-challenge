import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CharacterWidgetCard extends StatelessWidget {
  final int uid;
  final String? name;
  final String? birthYear;

  const CharacterWidgetCard({super.key, required this.uid, this.name, this.birthYear});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Colors.grey[100],
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? 'Luke Skywalker',
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                    Text(birthYear ?? 'Birth year: 112BBY'),
                  ],
                )
              ],
            ),
          ),
          onTap: () {
            Modular.to.pushNamed('/home/character/$uid');
          },
        ),
      ),
    );
  }
}
