import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../src/model/model_response_people.dart';

class CustomCardDetails extends StatelessWidget {
  final ResultCharacter resultCharacter;
  final int imagem;
  const CustomCardDetails(
      {Key? key, required this.resultCharacter, required this.imagem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: CachedNetworkImage(
            imageUrl:
                "https://starwars-visualguide.com/assets/img/characters/$imagem.jpg",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          title: const Text("Personagem"),
          subtitle: Text(resultCharacter.name),
          trailing: SizedBox(
            width: 120.0,
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  radius: 12.0,
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 9.0,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "1",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  radius: 12.0,
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 9.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
