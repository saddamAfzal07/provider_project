import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm_flutter/features/controller/counter.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterState = Provider.of<Counter>(context, listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<Counter>(
              builder: (BuildContext context, value, child) {
                print("listen builder");
                return Text(
                  value.count.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterState.increment();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
