import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../src/model/model_response_films.dart';

class CustomCardFilm extends StatelessWidget {
  final ResultFilms resultFilms;
  const CustomCardFilm({Key? key, required this.resultFilms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow[600],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: 180,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            resultFilms.thumbnail!.isNotEmpty
                ? CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    backgroundImage:
                        CachedNetworkImageProvider(resultFilms.thumbnail!))
                : const Center(
                    child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  )),
            Flexible(
              child: Center(
                  child: Text(
                resultFilms.title,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
