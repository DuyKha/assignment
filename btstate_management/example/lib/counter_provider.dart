import 'package:btstate_management/btstate_management.dart';

class CounterProvider extends BTProvider {
  var count = 100; //state

  void increment() {
    count += 25;
    notify(runtimeType);
  }
}