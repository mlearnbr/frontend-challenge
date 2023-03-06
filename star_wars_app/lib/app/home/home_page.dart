import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/app/home/home_store.dart';
import 'package:star_wars_app/app/widgets/character_widget_card.dart';
import 'package:star_wars_app/app/widgets/sliver_custom_app_bar_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  @override
  void initState() {
    store.charactersList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SliverCustomAppBar(),
            pinned: true,
          ),
          Observer(
            builder: (context) {
              final characters = store.characters;

              if (characters.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    if (index == store.characters.length) {
                      store.charactersList();
                      return _loading;
                    }
                    return CharacterWidgetCard(
                      uid: index.toString(),
                      url: characters[index].url!,
                      name: characters[index].name!,
                      birthYear: characters[index].birthYear!,
                      species: characters[index].species!,
                    );
                  }, childCount: characters.length + 1),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Center get _loading {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          width: 20.0,
          height: 20.0,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
