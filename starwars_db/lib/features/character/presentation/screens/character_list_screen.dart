import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:starwars_db/features/character/presentation/blocs/character_bloc.dart';
import 'package:starwars_db/features/character/presentation/widgets/character_card.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({Key? key}) : super(key: key);

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  @override
  void initState() {
    BlocProvider.of<CharacterBloc>(context).add(ListCharactersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: Image.asset(
        'assets/images/star_wars_logo.png',
        fit: BoxFit.contain,
        height: 60,
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (ctx, state) {
        if (state is CharacterInitialState || state is CharacterLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CharacterLoadedState) {
          final characters = state.characters;
          return GridView.builder(
            padding: const EdgeInsets.all(4),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 3 / 2,
            ),
            itemCount: characters.length,
            itemBuilder: (_, index) {
              return CharacterCard(character: characters[index]);
            },
          );
        }
        return Text(AppLocalizations.of(ctx)!.errSomethingWentWrong);
      },
    );
  }
}
