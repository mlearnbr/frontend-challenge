import 'package:flutter/material.dart';
import 'package:star_wars_app/app/layers/domain/models/person_model.dart';

import '../../../../shared/dependency_injection/dependency_injection.dart';
import '../../controllers/persons_controller.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});
  static const route = '/details';

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final controller = inject.get<PersonsController>();

  @override
  void initState() {
    if (controller.personSelected == null) {
      //  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.pop(context);
      //    });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.personSelected == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      var person = controller.personSelected!;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 70,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(16),
                child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      controller.personSelected = null;
                      Navigator.pop(context);
                    }),
              ),
              Column(
                children: [Text(person.name)],
              )
            ],
          ),
        ),
      );
    }
  }
}
