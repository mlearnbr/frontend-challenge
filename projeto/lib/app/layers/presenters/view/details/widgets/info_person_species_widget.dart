import 'package:flutter/material.dart';
import '../../common/species_text_widget.dart';

class InfoPersonSpecies extends StatelessWidget {
  const InfoPersonSpecies({
    Key? key,
    required this.list,
    required this.label,
  }) : super(key: key);

  final List list;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text('$label: '),
          InfoTextUrlWidget(
            list: list,
            label: label,
          ),
        ],
      ),
    );
  }
}
