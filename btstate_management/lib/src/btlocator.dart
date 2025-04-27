import 'package:btstate_management/src/btconsumer.dart';

class BTLocator {
  static final BTLocator _instance = BTLocator._();

  BTLocator._();

  factory BTLocator() => _instance;

  Map<Type, List<BTConsumer>> map = {};

  List<BTConsumer>? find(Type type) {
    return map[type];
  }

  void put(Type type, BTConsumer widget) {
    List<BTConsumer>? list = map[type];
    if (list == null) {
      list = [];
      map[type] = list;
    }
    list.add(widget);
  }

  void pop(Type type, BTConsumer widget) {
    List<BTConsumer>? list = map[type];
    if (list == null) {
      return;
    }
    list.remove(widget);
  }

  void popAll(Type type) {
    map[type] = [];
  }
}