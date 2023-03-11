import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_star_wars/app/home/presenter/widgets/item_character_widget.dart';

import 'home_store.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 50,
                      width: 100,
                      child: Image.asset('assets/images/star_wars_logo.png',
                          fit: BoxFit.contain)),
                  const Icon(
                    Icons.filter_list_rounded,
                    size: 28,
                  )
                ],
              ),
            ),
            Expanded(
              child: Observer(builder: (_) {
                return store.isLoading
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.amber[700],),
                      )
                    : Scrollbar(
                      controller: scrollController,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Wrap(
                              runSpacing: 16,
                              spacing: 16,
                              children: [
                                ...store.listPeople.map((character) {
                                  return ItemCharacterWidget(character: character);
                                }).toList()
                              ],
                            ),
                        ),
                      ),
                    );
              }),
            )
          ],
        ),
      ),
    );
  }
}
