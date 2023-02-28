import 'package:flutter/material.dart';
import 'package:flutter_application/features/character_details/presentation/character_details_page.dart';
import 'package:flutter_application/features/character_list/domain/entities/character_entity.dart';
import '../../../features/character_list/presentation/presentation.dart';

Map<String, Widget Function(BuildContext)> makeAppRoute() => {
      '/': (_) => const CharactersListPage(),
      '/details': (context) {
        final args =
            ModalRoute.of(context)!.settings.arguments as CharacterEntity;
        return CharacterDetailsPage(character: args);
      },
    };
