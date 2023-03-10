import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;
abstract class _AppStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}