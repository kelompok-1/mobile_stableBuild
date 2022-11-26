import 'package:flutter/material.dart';

class UserQuiz extends StatefulWidget {
  const UserQuiz({super.key});

  @override
  State<UserQuiz> createState() => _UserQuizState();
}

class _UserQuizState extends State<UserQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "QUIZ PAGE",
                style: TextStyle(fontSize: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
