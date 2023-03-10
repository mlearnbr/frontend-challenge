import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_star_wars/app/home/home_store.dart';
 
void main() {
  late HomeStore store;

  setUpAll(() {
    store = HomeStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}