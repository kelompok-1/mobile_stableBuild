import 'package:flutter/material.dart';
import 'package:skoolen/pages/login_page.dart';
import 'package:skoolen/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // initially show the login page
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return loginPage(showRegisterPage: toggleScreens);
    } else {
      return registerPage(showLoginPage: toggleScreens);
    }
  }
}
