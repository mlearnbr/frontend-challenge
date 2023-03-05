import 'package:flutter/material.dart';

class CharacterPage extends StatefulWidget {
  final String uid;
  const CharacterPage({Key? key, required this.uid}) : super(key: key);
  @override
  CharacterPageState createState() => CharacterPageState();
}

class CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.uid),
      ),
      body: Column(
        children: const <Widget>[Text('teste')],
      ),
    );
  }
}
