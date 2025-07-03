import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:myapp/entities/usuario.dart';

class HomeScreen extends StatefulWidget {
  final Usuario usuario;

  const HomeScreen({super.key, required this.usuario});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
Column(
  
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

     ] ),
    );
  }
}
