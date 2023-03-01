import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'startup/app_module.dart';
import 'startup/app_widget.dart';

void main() {
  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
