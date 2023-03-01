import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/films_model.dart';
import '../../../data/models/homeworld_model.dart';
import '../../../data/models/people_model.dart';
import '../../../data/models/species_model.dart';
import '../home_controller.dart';
import '../pages/details_page.dart';

class CustomContainer extends StatefulWidget {
  final PeopleModel model;

  const CustomContainer({
    required this.model,
    super.key,
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  Rx<SpeciesModel> species = SpeciesModel(name: '').obs;
  Rx<HomeworldModel> homeworld = HomeworldModel(name: '').obs;
  RxList<FilmsModel> films = <FilmsModel>[].obs;

  @override
  void initState() {
    super.initState();

    if (widget.model.species!.isNotEmpty) {
      Get.find<HomeController>()
          .getSpecies(widget.model.species
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', ''))
          .then((value) => species.value = value);
    }

    Get.find<HomeController>()
        .getHomeworld(widget.model.homeworld)
        .then((value) => homeworld.value = value);

    for (var urls in widget.model.films) {
      Get.find<HomeController>()
          .getFilms(urls)
          .then((value) => films.addAll([value]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              peopleModel: widget.model,
              speciesModel: species.value,
              homeworldModel: homeworld.value,
              listFilmsModel: films,
            ),
          ),
        );
      },
      child: Container(
        height: 110,
        decoration: const BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Text(
                  widget.model.name,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              Flexible(
                flex: 1,
                child: Obx(
                  () => Text(
                    species.value.name == '' ? 'Human' : species.value.name,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  widget.model.birthYear,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
