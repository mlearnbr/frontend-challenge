import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapi_app/shared/utils/app_assets.dart';
import 'package:swapi_app/src/presentation/details/details_controller.dart';
import 'package:swapi_app/src/presentation/details/widgets/info_card.dart';
import 'package:swapi_app/src/presentation/global_widgets/loader_widget.dart';

class DetailsPage extends GetView<DetailsController> {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(Get.arguments['people']);
    return Stack(
      children: [
        Image.asset(
          AppAssets.background,
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text(
              'Character Details',
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              InfoCard(
                title: 'Name',
                body: controller.people.name,
              ),
              const SizedBox(
                height: 10,
              ),
              InfoCard(
                title: 'Birth Year',
                body: controller.people.birthYear ?? 'Not specified',
              ),
              const SizedBox(
                height: 10,
              ),
              InfoCard(
                title: 'Eye Color',
                body: controller.people.eyeColor,
              ),
              const SizedBox(
                height: 10,
              ),
              InfoCard(
                title: 'Gender',
                body: controller.people.gender ?? 'Not specified',
              ),
              const SizedBox(
                height: 10,
              ),
              InfoCard(
                title: 'Hair color',
                body: controller.people.hairColor ?? 'Not specified',
              ),
              const SizedBox(
                height: 10,
              ),
              InfoCard(
                title: 'Heigth',
                body: controller.people.heigth,
              ),
              const SizedBox(
                height: 10,
              ),
              InfoCard(
                title: 'Mass',
                body: controller.people.mass,
              ),
              const SizedBox(
                height: 10,
              ),
              InfoCard(
                title: 'Skin Color',
                body: controller.people.skinColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() {
                if (controller.loadingPlanet.value) {
                  return const LoaderWidget();
                } else if (!controller.loadingPlanet.value &&
                    controller.planet.value == null) {
                  return const SizedBox();
                }
                return InfoCard(
                  title: 'Planet',
                  body: controller.planet.value!.name,
                );
              }),
              const SizedBox(
                height: 10,
              ),
              Obx(() {
                if (controller.loadingMovies.value) {
                  return const LoaderWidget();
                } else if (!controller.loadingMovies.value &&
                    controller.movies.isEmpty) {
                  return const SizedBox();
                }
                return InfoCard(
                  title: 'Movies',
                  body: '',
                  bodyWidget: Column(
                    children: controller.movies
                        .map(
                          (element) => Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Text(
                              element.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              }),
              const SizedBox(
                height: 10,
              ),
              controller.people.species.isEmpty
                  ? const SizedBox()
                  : Obx(
                      () {
                        if (controller.loadingSpecies.value) {
                          return const LoaderWidget();
                        } else if (!controller.loadingSpecies.value &&
                            controller.species.isEmpty) {
                          return const SizedBox();
                        }
                        return InfoCard(
                          title: 'Species',
                          body: '',
                          bodyWidget: Column(
                            children: controller.species
                                .map(
                                  (element) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                    ),
                                    child: Text(
                                      element.name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        );
                      },
                    ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
