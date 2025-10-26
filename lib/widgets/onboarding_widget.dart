import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image,height: 320,fit: BoxFit.cover,),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1C1C1E)
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF8E8E93)
            ),
          )
        ],
      ),
    );
  }
}