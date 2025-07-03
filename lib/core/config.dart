
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/usuario.dart';
import 'package:myapp/presentations/screens/card_details.dart';
import 'package:myapp/presentations/screens/card_modo.dart';
import 'package:myapp/presentations/screens/home.dart';
import 'package:myapp/presentations/screens/login.dart';
import 'package:myapp/presentations/screens/lego_screen.dart';
import 'package:myapp/presentations/screens/probar.dart';
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

      path: '/probar',
      builder: (BuildContext context, GoRouterState state) {
        return MyWidget (); // Puedes poner tu HomeScreen aquí
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
      path: '/card_detail',
      builder: (BuildContext context, GoRouterState state) {
        return const CardDetails();
      },
     
    ), 
                GoRoute(
      path: '/card_edit/add',
      builder: (BuildContext context, GoRouterState state) {
        return const CardModo();
      },
     
    ), 

  ],
);