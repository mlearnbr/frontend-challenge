import 'package:flutter/material.dart';
import 'package:star_wars_app/app/layers/presenters/controllers/theme_controller.dart';
import 'package:star_wars_app/app/layers/presenters/view/details/details_page.dart';
import 'package:star_wars_app/app/layers/presenters/view/home/home_page.dart';
import 'package:star_wars_app/app/shared/dependency_injection/dependency_injection.dart';

import 'shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final controller = inject.get<ThemeController>();
    return ValueListenableBuilder<ThemeData>(
        valueListenable: controller.themeData,
        builder: (context, theme, _) {
          return MaterialApp(
            title: 'Persons Star Wars',
            theme: DefaultTheme.light,
            themeMode: ThemeMode.dark,
            darkTheme: theme,
            highContrastDarkTheme: DefaultTheme.contrast,
            debugShowCheckedModeBanner: false,
            initialRoute: HomePage.route,
            onGenerateRoute: (settings) {
              var route = settings.name;
              Widget page;

              switch (route) {
                case DetailsPage.route:
                  page = const DetailsPage();
                  break;

                case HomePage.route:
                  page = const HomePage();
                  break;

                default:
                  page = const HomePage();
              }

              return PageRouteBuilder(
                  maintainState: false,
                  settings: settings,
                  pageBuilder: (context, animation, secondaryAnimation) => page,
                  transitionDuration: const Duration(milliseconds: 200),
                  transitionsBuilder:
                      (context, animation, secAnimation, child) {
                    animation = CurvedAnimation(
                        parent: animation, curve: Curves.decelerate);
                    return SlideTransition(
                      position: Tween(
                              begin: const Offset(1.0, 0.0),
                              end: const Offset(0.0, 0.0))
                          .animate(animation),
                      child: child,
                    );
                  });
              /* 
                  return MaterialPageRoute(
                      builder: (context) => page, settings: settings); */
            },
            // routes: {
            //   HomePage.route: (context) => const HomePage(),
            //   DetailsPage.route: (context) => DetailsPage(),
            // },
          );
        });
  }
}
