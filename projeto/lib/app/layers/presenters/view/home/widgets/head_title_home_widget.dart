import 'package:flutter/material.dart';
import 'package:star_wars_app/app/layers/presenters/controllers/theme_controller.dart';
import 'package:star_wars_app/app/shared/dependency_injection/dependency_injection.dart';
import 'package:star_wars_app/app/shared/theme/colors_theme_const.dart';
import 'package:star_wars_app/app/shared/theme/theme.dart';

class HeadTitleHome extends StatelessWidget {
  const HeadTitleHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = inject.get<ThemeController>();
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints(minHeight: 80, maxHeight: 150),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Row(
            children: [
              Expanded(
                  child: Image.asset(
                'assets/Star_Wars_Logo.png',
              )),
              const SizedBox(width: 16),
              Expanded(
                flex: 4,
                child: Text(
                  'Learn more about your favorite Star Wars character',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: themeYellow),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
              child: ValueListenableBuilder<ThemeData>(
                  valueListenable: themeController.themeData,
                  builder: (context, theme, _) {
                    return Row(
                      children: [
                        Icon(
                          Icons.contrast,
                          color:
                              themeController.isContrast ? themeYellow : null,
                        ),
                        Switch(
                          inactiveTrackColor: Colors.white24,
                          value: (themeController.isContrast),
                          onChanged: (value) {
                            if (value) {
                              themeController.setToContrast();
                            } else {
                              //     themeController.themeLight.value = false;
                              themeController.setToDark();
                            }
                          },
                        ),
                      ],
                    );
                  })),
        )
      ],
    );
  }
}
