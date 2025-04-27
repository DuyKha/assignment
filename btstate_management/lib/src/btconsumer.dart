import 'package:btstate_management/src/btlocator.dart';
import 'package:btstate_management/src/btprovider.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class BTConsumer<T extends BTProvider> extends StatefulWidget {
  final T provider;
  final Widget Function() builder;
  late BTConsumerState state;

  BTConsumer({
    Key? key,
    required this.provider,
    required this.builder,
  }) : super(key: key) {
    BTLocator().put(provider.runtimeType, this);
  }

  @override
  BTConsumerState createState() {
    state = BTConsumerState();
    return state;
  }
}

class BTConsumerState extends State<BTConsumer> {
  void changeState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder();
  }

  @override
  void dispose() {
    BTLocator().pop(widget.provider.runtimeType, widget);
    super.dispose();
  }
}
