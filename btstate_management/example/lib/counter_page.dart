import 'package:btstate_management/btstate_management.dart';
import 'package:example/counter_provider.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  CounterPage({Key? key}) : super(key: key);

  final provider = CounterProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BTConsumer<CounterProvider>(
                provider: provider,
                builder: () => Text(provider.count.toString()),
              ),
            ],
          ),
        ),
        Positioned.fill(
          bottom: 50,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                onPressed: () => provider.increment(), //change state
                child: const Text("Increment")),
          ),
        )
      ]),
    );
  }
}
