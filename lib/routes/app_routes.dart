import 'package:btl_moblie/screens/achievement_screen.dart';
import 'package:btl_moblie/screens/author_screen.dart';
import 'package:btl_moblie/screens/create_flashcard_screen.dart';
import 'package:btl_moblie/screens/edit_profile_screen.dart';
import 'package:btl_moblie/screens/home_screen.dart';
import 'package:btl_moblie/screens/login_or_signup_screen.dart';
import 'package:btl_moblie/screens/login_screen.dart';
import 'package:btl_moblie/screens/onboarding_screen.dart';
import 'package:btl_moblie/screens/sign_up_screen.dart';
import 'package:btl_moblie/screens/splash_screen.dart';
// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'splashScreen',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/loginorsignup',
      name: 'loginOrSignup',
      builder: (context, state) => const LoginOrSignUpScreen(),
    ),

    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signUp',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'homeScreen',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/create',
      name: 'create',
      builder: (context, state) => const CreateFlashcardScreen(),
    ),
    GoRoute(
      path: '/achievement',
      name: 'achievement',
      builder: (context, state) => const AchievementScreen(),
    ),
    GoRoute(
      path: '/editprofile',
      name: 'editProfile',
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: '/author',
      name: 'author',
      builder: (context, state) => const AuthorScreen(),
    ),
  ],
);
