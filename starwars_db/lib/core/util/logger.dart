import 'package:flutter/foundation.dart';

class Logger {
  static void log(Object object) {
    if (kDebugMode) print(object);
  }
}
