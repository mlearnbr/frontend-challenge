import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars_db/features/character/presentation/blocs/character_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:starwars_db/features/character/presentation/screens/character_details_screen.dart';

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
      title: Text(AppLocalizations.of(context)!.characters),
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
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(characters[index].name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => CharacterDetailsScreen(
                        character: characters[index],
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
        return Text(AppLocalizations.of(ctx)!.errSomethingWentWrong);
      },
    );
  }
}
