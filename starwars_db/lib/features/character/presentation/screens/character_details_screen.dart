import 'package:flutter/material.dart';
import 'package:starwars_db/core/constants/constants.dart';
import 'package:starwars_db/features/character/domain/entities/character.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final Character character;

  const CharacterDetailsScreen({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
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
      title: Text(
        widget.character.name,
      ),
      elevation: 0,
    );
  }

  Widget _buildBody() {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildImage(),
            const SizedBox(height: 24),
            _buildDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/star_wars_logo.png"),
          opacity: 0.1,
          fit: BoxFit.cover,
        ),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image.network(
        kCharacterImageBaseUrl + widget.character.imagePath,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _buildDetails() {
    final appLocalizations = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        children: [
          _buildDetailsText(
            label: appLocalizations.name,
            text: widget.character.name,
          ),
          _buildDetailsText(
            label: appLocalizations.birthYear,
            text: widget.character.birthYear,
          ),
          _buildDetailsText(
            label: appLocalizations.eyeColor,
            text: widget.character.eyeColor,
          ),
          _buildDetailsText(
            label: appLocalizations.gender,
            text: widget.character.gender,
          ),
          _buildDetailsText(
            label: appLocalizations.hairColor,
            text: widget.character.hairColor,
          ),
          _buildDetailsText(
            label: appLocalizations.height,
            text: widget.character.height,
          ),
          _buildDetailsText(
            label: appLocalizations.mass,
            text: widget.character.mass,
          ),
          _buildDetailsText(
            label: appLocalizations.skinColor,
            text: widget.character.skinColor,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsText({required String label, required String text}) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.grey,
                fontSize: 14,
              ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
