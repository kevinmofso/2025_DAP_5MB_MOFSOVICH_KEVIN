import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/config.dart';
void main() {
  runApp(ProviderScope(child:MyApp()));
}
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}