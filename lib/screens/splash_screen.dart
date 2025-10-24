import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
  void initState() {
    super.initState();

    // Sau 3 giây sẽ tự chuyển sang màn hình Home
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/home'); // điều hướng sang route '/home'
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/LogoFlashNote.png", height: 200),
            Text(
              "Flash Note",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
