import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_star_wars/app/home/domain/entities/films_entity.dart';
import 'package:flutter_star_wars/app/home/presenter/widgets/item_character_widget.dart';
import 'package:flutter_star_wars/app/utils/app_images.dart';

import 'home_store.dart';
import 'widgets/item_container_filter_selected_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    store.getPeople();
    store.getFilms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  opacity: 0.9,
                  image: NetworkImage(AppImages.backgroundHome),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 60,
                            width: 100,
                            child: Image.asset(AppImages.starWarsLogo,
                                fit: BoxFit.contain)),
                        Observer(builder: (_) {
                          return SizedBox(
                            width: 207,
                            child: DropdownButton<FilmsEntity>(
                                focusColor: Colors.transparent,
                                disabledHint: const SizedBox.shrink(),
                                isExpanded: false,
                                borderRadius: BorderRadius.circular(16),
                                icon: const Icon(
                                  Icons.filter_list_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                                iconSize: 18,
                                underline: const SizedBox.shrink(),
                                onChanged: (FilmsEntity? newValue) async {
                                  store.setLoading(true);
                                  setState(() {
                                    store.filmSelected = newValue;
                                  });
                                  await Future.delayed(
                                      const Duration(seconds: 1));
                                  store.setLoading(false);
                                },
                                items: store.listFilms
                                    .map<DropdownMenuItem<FilmsEntity>>(
                                        (FilmsEntity value) {
                                  return DropdownMenuItem<FilmsEntity>(
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(value.title),
                                    ),
                                  );
                                }).toList()),
                          );
                        }),
                      ],
                    ),
                    Observer(builder: (_) {
                      return store.filmSelected != null
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                ItemContainerFilterSelectedWidget(
                                    filterSelected: store.filmSelected!.title),
                              ],
                            )
                          : Container();
                    })
                  ],
                ),
              ),
              Expanded(
                child: Observer(builder: (_) {
                  return store.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.amber[300],
                          ),
                        )
                      : Scrollbar(
                          controller: scrollController,
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Observer(builder: (_) {
                                if (store.filmSelected != null) {
                                  return Wrap(
                                    runSpacing: 16,
                                    spacing: 16,
                                    children: [
                                      ...store.listPeople
                                          .where((e) => e.films
                                              .map((el) => el
                                                  .toString()
                                                  .replaceAll(
                                                      'https://swapi.dev/api/films/',
                                                      '')
                                                  .replaceAll('/', ''))
                                              .contains(store.filmSelected!.url
                                                  .replaceAll(
                                                      'https://swapi.dev/api/films/',
                                                      '')
                                                  .replaceAll('/', '')))
                                          .map((character) {
                                        return ItemCharacterWidget(
                                            character: character);
                                      }).toList()
                                    ],
                                  );
                                }
                                return Wrap(
                                  runSpacing: 16,
                                  spacing: 16,
                                  children: [
                                    ...store.listPeople.map((character) {
                                      return ItemCharacterWidget(
                                          character: character);
                                    }).toList()
                                  ],
                                );
                              }),
                            ),
                          ),
                        );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
