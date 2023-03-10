import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_store.dart';

class AppPage extends StatefulWidget {
  final String title;
  const AppPage({Key? key, this.title = 'AppPage'}) : super(key: key);
  @override
  AppPageState createState() => AppPageState();
}
class AppPageState extends State<AppPage> {
  final AppStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/home/');

    return MaterialApp.router(
      title: 'Star Wars App',
      debugShowCheckedModeBanner: false,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}