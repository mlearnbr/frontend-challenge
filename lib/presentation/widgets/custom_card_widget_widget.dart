import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../helpers/type_specie.dart';
import '../../src/base_url/base_url_api.dart';
import '../../src/model/model_response_people.dart';

class CustomWidgetCard extends StatelessWidget {
  final String image;
  final int idCharacter;
  final ResultCharacter resultCharacter;
  const CustomWidgetCard(
      {Key? key,
      required this.image,
      required this.idCharacter,
      required this.resultCharacter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 350,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: const [
              BoxShadow(blurRadius: 10),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: "$urlImg$image.jpg",
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
        Positioned(
            right: 1,
            top: 1,
            child: Container(
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.yellow[600],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
              child: Center(
                  child: Text(
                "#0$idCharacter",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )),
            )),
        Positioned(
          bottom: 2,
          right: 2,
          left: 2,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.black.withAlpha(150),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            height: 60,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name: ${resultCharacter.name}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        "Species: ${setTypeSpecie(idCharacter)}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        "birth: ${resultCharacter.birthYear}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
