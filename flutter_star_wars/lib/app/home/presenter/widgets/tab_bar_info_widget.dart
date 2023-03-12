import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/people_entity.dart';
import '../home_store.dart';

class TabBarInfoWidget extends StatefulWidget {
  final PeopleEntity character;

  const TabBarInfoWidget({super.key, required this.character});

  @override
  State<TabBarInfoWidget> createState() => _TabBarInfoWidgetState();
}

class _TabBarInfoWidgetState extends State<TabBarInfoWidget> {
  final HomeStore store = Modular.get();

  String specieName = '-- --';
  @override
  void initState() {
    final result = store.getSpecies(widget.character.species);
    result!.then((value) {
      setState(() {
        specieName = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _itemInfo('Birthday', widget.character.birthYear ?? '-- --'),
          _itemInfo('Eye Color', widget.character.eyeColor ?? '-- --'),
          _itemInfo('Gender', widget.character.gender ?? '-- --'),
          _itemInfo('Hair Color', widget.character.hairColor ?? '-- --'),
          _itemInfo('Height', widget.character.height ?? '-- --'),
          _itemInfo('Mass', widget.character.mass ?? '-- --'),
          _itemInfo('Skin Color', widget.character.skinColor ?? '-- --'),
          _itemInfo('Species', specieName),
        ],
      ),
    );
  }

  _itemInfo(String info, String value) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              info,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(value),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ],
    );
  }
}
