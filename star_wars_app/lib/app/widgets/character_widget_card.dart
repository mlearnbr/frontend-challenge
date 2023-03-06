import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CharacterWidgetCard extends StatelessWidget {
  final String uid;
  final String url;
  final String name;
  final String birthYear;
  final List species;

  const CharacterWidgetCard({
    super.key,
    required this.uid,
    required this.url,
    required this.name,
    required this.birthYear,
    required this.species,
  });

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        const Text('Birth Year: '),
                        Text(birthYear),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          onTap: () {
            Modular.to.pushNamed(
              '/home/character/',
              arguments: {
                "uid": uid,
                "url": url,
              },
            );
          },
        ),
      ),
    );
  }
}
