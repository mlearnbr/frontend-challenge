import 'package:flutter/material.dart';
import 'package:swapi_app/src/domain/entities/people_entity.dart';
import 'package:swapi_app/src/presentation/home/widgets/bottom_loader.dart';
import 'package:swapi_app/src/presentation/home/widgets/people_tile.dart';

class ListViewPeoples extends StatelessWidget {
  final List<PeopleEntity> peoples;
  final ScrollController scrollController;
  final bool isLoading;
  const ListViewPeoples({
    Key? key,
    required this.peoples,
    required this.scrollController,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scrollbar(
          thickness: 8,
          thumbVisibility: true,
          radius: const Radius.circular(10),
          interactive: true,
          trackVisibility: false,
          controller: scrollController,
          child: ListView.builder(
            controller: scrollController,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: peoples.length,
            itemBuilder: (_, index) {
              final people = peoples[index];
              return PeopleTile(
                index: index,
                people: people,
              );
            },
          ),
        ),
        BottomLoaderWidget(
          isLoading: isLoading,
        ),
      ],
    );
  }
}
