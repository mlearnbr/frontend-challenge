import 'package:get/get.dart';

import '../../src/interface/interface_provider.dart';

class HomeController extends GetxController with StateMixin {
  final InterfaceProvider interfaceProvider;

  HomeController(this.interfaceProvider);
}
