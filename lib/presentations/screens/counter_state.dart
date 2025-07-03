import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/presentations/providers.dart';
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1802236906.
class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4236223968.
    final counter = ref.watch(counterProvider);
    return Scaffold(
body: Center(
  child: 
  Text('Counter: $counter')),
 floatingActionButton:FloatingActionButton(
  onPressed: () {
    ref.read(counterProvider.notifier).update((state) => state + 1);
  },
  child: const Icon(Icons.add),
),
    );
  }
}