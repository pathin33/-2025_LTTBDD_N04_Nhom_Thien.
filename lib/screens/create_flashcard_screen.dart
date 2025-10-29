import 'package:btl_moblie/widgets/bottomnavigationbar_widget.dart';
import 'package:flutter/material.dart';

class CreateFlashcardScreen extends StatefulWidget {
  const CreateFlashcardScreen({super.key});

  @override
  State<CreateFlashcardScreen> createState() => _CreateFlashcardScreenState();
}

class _CreateFlashcardScreenState extends State<CreateFlashcardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Create FlashCard screens"),),
      bottomNavigationBar: const BottomnavigationbarWidget(),
    );
  }
}