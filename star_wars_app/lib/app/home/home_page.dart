import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/app/home/home_store.dart';
import 'package:star_wars_app/app/widgets/character_widget_card.dart';
import 'package:star_wars_app/app/widgets/sliver_custom_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SliverCustomAppBar(),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return CharacterWidgetCard(
                uid: index,
              );
            }, childCount: 20),
          ),
        ],
      ),
    );
  }
}
