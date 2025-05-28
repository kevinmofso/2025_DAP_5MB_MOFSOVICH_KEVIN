
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/presentations/screens/home.dart';
import 'package:myapp/presentations/screens/login.dart';
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(

      path: '/', 
      builder: (BuildContext context, GoRouterState state) {
        return Login(); // Puedes poner tu HomeScreen aquí
      },
    ),
        GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
     
    ), 
       GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
                        final String usuario = state.extra as String; 
        return HomeScreen(usuario: usuario,);


      },
    ),

  ],
);