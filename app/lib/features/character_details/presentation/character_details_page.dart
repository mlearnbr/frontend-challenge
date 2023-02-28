import 'package:flutter/material.dart';
import 'package:flutter_application/core/config/injection/injection.dart';
import 'package:flutter_application/core/widgets/loading_widget.dart';
import 'package:flutter_application/features/character_details/domain/controllers/character_details_controller.dart';
import 'package:flutter_application/features/character_details/presentation/widgets/widgets.dart';
import 'package:flutter_application/features/character_list/domain/entities/character_entity.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CharacterDetailsPage extends StatefulWidget {
  final CharacterEntity character;
  const CharacterDetailsPage({super.key, required this.character});

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  final ICharacterDetailsController controller = getIt();
  @override
  void initState() {
    super.initState();
    controller.getCharacterFilmList(widget.character.films);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        elevation: 0,
      ),
      body: Observer(builder: (context) {
        if (controller.isLoading) {
          return const Center(child: LoadingWidget());
        } else {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CharacterDetailsHeaderWidget(character: widget.character),
                  CharacterDetailsInfoWidget(
                    character: widget.character,
                    characterFilms: controller.filmList,
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
