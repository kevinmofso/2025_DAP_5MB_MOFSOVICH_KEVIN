import 'package:flutter/material.dart';
import 'core/config.dart';
void main() {
  runApp(const MaterialApp(home: MyApp()));
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