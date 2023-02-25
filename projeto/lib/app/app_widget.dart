import 'package:flutter/material.dart';
import 'package:star_wars_app/app/layers/domain/models/person_model.dart';
import 'package:star_wars_app/app/layers/presenters/view/details/details_page.dart';
import 'package:star_wars_app/app/layers/presenters/view/home/home_page.dart';

import 'shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persons Star Wars',
      theme: DefaultTheme.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.route,
      onGenerateRoute: (settings) {
        var route = settings.name;
        Widget page;

        switch (route) {
          case DetailsPage.route:
            page = DetailsPage();
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
            transitionsBuilder: (context, animation, secAnimation, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.decelerate);
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
  }
}
