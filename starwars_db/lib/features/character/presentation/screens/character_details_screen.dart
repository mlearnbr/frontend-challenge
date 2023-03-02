import 'package:flutter/material.dart';
import 'package:starwars_db/core/constants/constants.dart';
import 'package:starwars_db/features/character/domain/entities/character.dart';

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
      title: Text(widget.character.name),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildImage(),
          _buildTitle(),
          _buildDescription(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image.network(
        kCharacterImageBaseUrl + widget.character.imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.character.name,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget _buildDescription() {
    return Text(widget.character.gender);
  }
}
