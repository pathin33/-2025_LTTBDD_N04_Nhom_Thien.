import 'package:btl_moblie/widgets/appbarhome_widget.dart';
import 'package:btl_moblie/widgets/bottomnavigationbar_widget.dart';
import 'package:btl_moblie/widgets/sildebar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarhomeWidget(),
      drawer: const SildebarWidget(),
      body: Center(child: Text("Screen Home")),
      bottomNavigationBar: const BottomnavigationbarWidget(),
    );
  }
}
