import 'package:flutter/material.dart';
import 'package:flutter_application/core/widgets/loading_widget.dart';
import 'package:flutter_application/features/character_list/presentation/character_list/widgets/character_list_item_widget.dart';
import 'package:flutter_application/features/character_list/presentation/character_list/widgets/load_more_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_application/features/character_list/domain/controllers/character_list_controller.dart';
import '../../../../core/config/injection/injection.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({super.key});

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  final ICharacterListController controller = getIt();
  @override
  void initState() {
    super.initState();
    controller.getCharacterList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          if (controller.isLoading) {
            return const Center(child: LoadingWidget());
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 100),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.characterList.length,
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _getCrossAxisCount(),
                      crossAxisSpacing: 28,
                      mainAxisSpacing: 13,
                    ),
                    itemBuilder: (BuildContext context, index) {
                      return CharacterListItemWidget(
                        name: controller.characterList[index].name,
                        specie: 'specie',
                        birthYear: 'birthYear',
                      );
                    },
                  ),
                  Visibility(
                    visible: controller.isLoadingMore,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: LoadingWidget()),
                    ),
                  ),
                  LoadMoreWidget(
                    onTap: () => controller.getCharacterList(loadingMore: true),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  int _getCrossAxisCount() {
    final screenWidth = MediaQuery.of(context).size.width;
    const itemWidth = 160;
    final crossAxisCount = (screenWidth / itemWidth).floor();
    return crossAxisCount;
  }
}
