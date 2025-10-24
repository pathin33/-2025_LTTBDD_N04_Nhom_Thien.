import 'package:btl_moblie/routes/app_routes.dart';
// import 'package:btl_moblie/screens/splash_screen.dart';
import 'package:btl_moblie/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(MyWidget());
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}