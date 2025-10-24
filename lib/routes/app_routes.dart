import 'package:btl_moblie/screens/home_screen.dart';
import 'package:btl_moblie/screens/splash_screen.dart';
// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'splashScreen',
      builder: (context, state) => const SplashScreen()
    ),
    GoRoute(
      path: '/home',
      name: 'homeScreen',
      builder: (context, state) => const HomeScreen(),
    )
  ],
);