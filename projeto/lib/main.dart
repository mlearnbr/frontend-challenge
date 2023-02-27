import 'package:flutter/material.dart';
import 'app/shared/dependency_injection/dependency_injection.dart';

import 'app/app_widget.dart';

void main() {
  initInject();
  inject.allReady().then((value) => runApp(const MyApp()));
}
