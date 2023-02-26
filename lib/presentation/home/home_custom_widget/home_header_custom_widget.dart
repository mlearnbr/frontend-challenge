import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/base_url/base_url_api.dart';
import '../../../src/model/model_response_films.dart';
import '../../widgets/custom_card_film.dart';
import '../home_controller.dart';

class HomeHeaderCustomWidget extends StatelessWidget {
  final HomeController controller;

  const HomeHeaderCustomWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: Get.width,
        height: 40,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.films.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final ResultFilms resultFilms = controller.films[index];
            if (index == 0) {
              resultFilms.thumbnail = film1;
            }
            if (index == 1) {
              resultFilms.thumbnail = film2;
            }
            if (index == 2) {
              resultFilms.thumbnail = film3;
            }
            if (index == 3) {
              resultFilms.thumbnail = film4;
            }
            if (index == 4) {
              resultFilms.thumbnail = film5;
            }
            if (index == 5) {
              resultFilms.thumbnail = film6;
            }
            return GestureDetector(
                onTap: () {
                  controller.cleanListFilter();
                  controller.filterPeopleFilms(resultFilms.characters);
                },
                child: CustomCardFilm(resultFilms: resultFilms));
          },
        ),
      ),
    );
  }
}
