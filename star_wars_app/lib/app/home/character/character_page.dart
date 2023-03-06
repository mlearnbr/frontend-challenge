import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/app/home/character/character_store.dart';

class CharacterPage extends StatefulWidget {
  final String uid;
  const CharacterPage({Key? key, required this.uid}) : super(key: key);
  @override
  CharacterPageState createState() => CharacterPageState();
}

class CharacterPageState extends State<CharacterPage> {
  final CharacterStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final character = store.character.value;

        if (character != null) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(character.name!),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  character.name != ""
                      ? Row(
                          children: [
                            const Text(
                              'Name: ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              character.name!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  character.eyeColor != ""
                      ? Row(
                          children: [
                            const Text(
                              'Birth Year: ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              character.birthYear!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  character.eyeColor != ""
                      ? Row(
                          children: [
                            const Text(
                              'Eye Color: ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              character.eyeColor!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  character.gender != ""
                      ? Row(
                          children: [
                            const Text(
                              'Gender: ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              character.gender!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  character.hairColor != ""
                      ? Row(
                          children: [
                            const Text(
                              'Hair Color: ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              character.hairColor!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  character.height != ""
                      ? Row(
                          children: [
                            const Text(
                              'Height: ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              character.height!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  character.mass != ""
                      ? Row(
                          children: [
                            const Text(
                              'Mass: ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              character.mass!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  character.skinColor != ""
                      ? Row(
                          children: [
                            const Text(
                              'Skin Color: ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              character.skinColor!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
