import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_counter/counter_notifier.dart';
import 'package:riverpod_counter/counter_state.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(),
    );
  }
}

class CounterPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CounterState counterState = ref.watch(counterProvider);
    final CounterNotifier counterNotifier = ref.watch(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('Count: ${counterState.value}'),
            ),
            ElevatedButton(
              onPressed: () => counterNotifier.increase(),
              child: const Text('Increase'),
            ),
            ElevatedButton(
              onPressed: () => counterNotifier.decrease(),
              child: const Text('Decrease'),
            )
          ],
        ),
      ),
    );
  }
}
