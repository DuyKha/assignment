import 'package:btstate_management/src/btconsumer.dart';
import 'package:btstate_management/src/btlocator.dart';

abstract class BTProvider {
  bool _isPause = false;

  void pause(bool isPause) {
    _isPause = isPause;
  }

  void notify(Type type) {
    if (_isPause) {
      return;
    }
    List<BTConsumer>? widgets = BTLocator().find(type);
    if (widgets != null) {
      for (BTConsumer w in widgets) {
        w.state.changeState();
      }
    }
  }

  void popAll() {
    BTLocator().popAll(runtimeType);
  }
}
