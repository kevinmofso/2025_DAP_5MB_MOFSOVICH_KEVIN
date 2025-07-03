
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/usuario.dart';
import 'package:myapp/presentations/screens/card_modo.dart';
import 'package:myapp/presentations/screens/home.dart';
import 'package:myapp/presentations/screens/login.dart';
import 'package:myapp/presentations/screens/lego_screen.dart';
import 'package:myapp/presentations/screens/counter_state.dart';
final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: <RouteBase>[
    GoRoute(

      path: '/movie_Screen',
      builder: (BuildContext context, GoRouterState state) {
        return const MovieScreen(); // Puedes poner tu HomeScreen aquí
      },
    ),
        GoRoute(

      path: '/counter_state',
      builder: (BuildContext context, GoRouterState state) {
        return const CounterScreen(); // Puedes poner tu HomeScreen aquí
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
      builder: (context, state) {
                    
        return HomeScreen(usuario: state.extra as Usuario);
        


      },
      
    ),
            GoRoute(
      path: '/card',
      builder: (BuildContext context, GoRouterState state) {
        return const CardModo();
      },
     
    ), 

  ],
);