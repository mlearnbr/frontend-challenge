import 'package:flutter/material.dart';
import 'package:star_wars_app/app/layers/presenters/controllers/persons_controller.dart';

import '../../../../../shared/helpers/const_films.dart';

Future<dynamic> showDialogFilterFilms(
    BuildContext context, PersonsController controller) {
  return showDialog(
      context: context,
      builder: ((context) => Dialog(
            backgroundColor: Colors.grey[300],
            child: Container(
              //     height: 200,
              width: 200,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text(
                      'Filter by films',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  /*    Container(
                                    padding: EdgeInsets.all(8),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Films:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ), */
                  Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      child: Column(
                          children: listFilms.map((e) {
                        return e != 'not_found'
                            ? ValueListenableBuilder(
                                valueListenable: controller.filterFilm,
                                builder: (context, films, _) {
                                  return CheckboxListTile(
                                      value: films.contains(e),
                                      dense: true,
                                      title: Text(e),
                                      onChanged: ((value) {
                                        if (value != null) {
                                          if (value) {
                                            controller.filterFilmAdd(e);
                                          } else {
                                            if (films.contains(e)) {
                                              controller.filterFilmRemove(e);
                                            }
                                          }
                                        }
                                      }));
                                })
                            : const SizedBox();
                      }).toList())),
                  ElevatedButton(
                      onPressed: (() => Navigator.pop(context)),
                      child: const Text('OK'))
                ],
              ),
            ),
          )));
}
