import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_star_wars/app/home/domain/entities/films_entity.dart';

import '../home_store.dart';

class TabBarFilmsWidget extends StatefulWidget {
  const TabBarFilmsWidget({super.key});

  @override
  State<TabBarFilmsWidget> createState() => _TabBarFilmsWidgetState();
}

class _TabBarFilmsWidgetState extends State<TabBarFilmsWidget> {
  final HomeStore store = Modular.get();

  List<FilmsEntity> films = [];

  @override
  void initState() {
    for (var element in store.characterSelected!.films) {
      var id = element
          .replaceAll('https://swapi.dev/api/films/', '')
          .replaceAll('/', '');
      setState(() {
        films.addAll(store.listFilms
            .where((element) => element.url.contains(id))
            .toList());
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Wrap(
          runSpacing: 16,
          spacing: 16,
          children: [
            ...films.map((e) {
              var thumbnail = store.getThumbnailByFilm(e.title);
              return Container(
                height: 150,
                width: 300,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0, 8),
                          blurRadius: 24)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Colors.white),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              decoration: const BoxDecoration(
                                // color: Colors.red,
                              ),
                              child: FadeInImage(
                                image: NetworkImage(thumbnail ?? "https://resizing.flixster.com/kMIUvpDVv_oQABEDe1lp-6HDQWw=/206x305/v2/https://flxt.tmsimg.com/assets/p4407_p_v12_ab.jpg"),
                                placeholder:
                                    const AssetImage("assets/icons/no_image.png"),
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return const Icon(Icons.error);
                                },
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    e.title,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Expanded(
                                    child: Text(
                                      e.openingCrawl ?? '-- --',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Text(
                                    e.created.year.toString(),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
