import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_star_wars/app/app_page.dart';

import 'app/app_module.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const AppPage()));
}
