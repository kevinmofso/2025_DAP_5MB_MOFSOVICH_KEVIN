import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/presentations/providers.dart';

class MyWidget extends ConsumerStatefulWidget {
  const MyWidget({super.key});

  @override
  ConsumerState<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<MyWidget> {
  @override
  void initState() {
    super.initState();
    
   
    final value = ref.read(counterProvider);
    // Por ejemplo, podrías hacer algo con ese valor:
    debugPrint('Valor inicial: $value');
  }

  @override
  Widget build(BuildContext context) {
    final someValue = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplo Riverpod')),
      body: Center(
        child: Text(
          'Valor del provider: $someValue',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
