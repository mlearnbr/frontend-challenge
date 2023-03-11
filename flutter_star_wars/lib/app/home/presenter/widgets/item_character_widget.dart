import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_star_wars/app/home/domain/entities/people_entity.dart';

import '../home_store.dart';

class ItemCharacterWidget extends StatefulWidget {
  final PeopleEntity character;
  const ItemCharacterWidget({super.key, required this.character});

  @override
  State<ItemCharacterWidget> createState() => _ItemCharacterWidgetState();
}

class _ItemCharacterWidgetState extends State<ItemCharacterWidget> {
  final HomeStore store = Modular.get();

  String specieName = '';
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
    return Container(
      height: 200,
      width: 300,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black38, offset: Offset(0, 8), blurRadius: 24)
          ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.character.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    specieName != '' ? specieName : 'Undefined species',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    widget.character.birthYear ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('More info', style: TextStyle(fontWeight: FontWeight.w500),),
                        Icon(
                          Icons.chevron_right_outlined,
                          size: 30,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.amber[700],
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            width: 20,
          ),
        ],
      ),
    );
  }
}
