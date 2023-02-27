import 'package:flutter/material.dart';

import '../../../../shared/dependency_injection/dependency_injection.dart';
import '../../controllers/persons_controller.dart';

class InfoTextUrlWidget extends StatelessWidget {
  const InfoTextUrlWidget({
    Key? key,
    required this.list,
    required this.label,
  }) : super(key: key);

  final List list;
  final String label;

  @override
  Widget build(BuildContext context) {
    final controller = inject.get<PersonsController>();
    return Container(
      child: list.isNotEmpty
          ? Row(
              children: list.map((specieUrl) {
                return FutureBuilder<String>(
                    future: controller.getSpecie(specieUrl),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          '${snapshot.data!} ',
                          style: Theme.of(context).textTheme.bodyText1,
                        );
                      }
                      return Text(
                        '...',
                        style: Theme.of(context).textTheme.bodyText1,
                      );
                    });
              }).toList(),
            )
          : Text(
              '$label undefined',
              style: Theme.of(context).textTheme.bodyText1,
            ),
    );
  }
}
