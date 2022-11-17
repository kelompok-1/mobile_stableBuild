// ignore_for_file: prefer_const_constructors, camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skoolen/pages/onboarding_page.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return onboardingPage();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Splash Screen.png",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/logo_tagline.png",
                  ),
                  scale: 2,
                ),
              ),
            ),
          ],
          // alignment: Alignment.center,
          // padding: const EdgeInsets.all(0),
        ),
      ),
    );
  }
}
