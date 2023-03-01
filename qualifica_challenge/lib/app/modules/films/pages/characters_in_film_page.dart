import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/films_model.dart';
import '../../../data/models/people_model.dart';
import '../films_controller.dart';

class CharactersInFilmPage extends StatefulWidget {
  final FilmsModel model;

  const CharactersInFilmPage({
    required this.model,
    super.key,
  });

  @override
  State<CharactersInFilmPage> createState() => _CharactersInFilmPageState();
}

class _CharactersInFilmPageState extends State<CharactersInFilmPage> {
  RxList<PeopleModel> people = <PeopleModel>[].obs;

  @override
  void initState() {
    super.initState();

    for (var urls in widget.model.characters) {
      Get.find<FilmsController>()
          .getPeopleCatalog(urls)
          .then((value) => people.addAll([value]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.title.toUpperCase()),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                const Text('Personagens no filme: '),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Obx(
                    () => SizedBox(
                      height: constraints.maxHeight * 0.912,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3.5,
                        ),
                        itemCount: people.length,
                        itemBuilder: (context, index) {
                          return Chip(
                            backgroundColor: Colors.yellow,
                            label: Text(
                              people[index].name,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
