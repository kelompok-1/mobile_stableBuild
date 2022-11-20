// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolen/pages/home_page.dart';

class VerifyEmail extends StatefulWidget {
  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVeryfied = false;
  bool canResendEmail = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    isEmailVeryfied = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVeryfied) {
      sendVerificationEmail();
      Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVeryfied(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVeryfied() async {
    try {
      await FirebaseAuth.instance.currentUser!.reload();
      setState(() {
        isEmailVeryfied = FirebaseAuth.instance.currentUser!.emailVerified;
      });
      if (isEmailVeryfied) timer?.cancel();
    } catch (e) {
      print(e);
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Terlalu banyak request, coba lagi nanti",
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.grey[500],
      );
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVeryfied
      ? HomePage()
      : Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.grey[200],
            leading: IconButton(
              splashRadius: 19,
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () => FirebaseAuth.instance.signOut(),
            ),
            elevation: 1,
            title: Text(
              "Verifikasi Akun",
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'E-Mail untuk verifikasi email sudah dikirim ke akunmu.',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    backgroundColor: Color(0xff00B1D2),
                    minimumSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  icon: Icon(Icons.email, size: 32),
                  label: Text(
                    "Kirim ulang tautan",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: canResendEmail ? sendVerificationEmail : null,
                ),
                // SizedBox(height: 8),
                // TextButton(
                //   style: ElevatedButton.styleFrom(
                //     minimumSize: Size.fromHeight(50),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(40),
                //     ),
                //   ),
                //   child: Text(
                //     "Batal",
                //     style: TextStyle(fontSize: 24, color: Color(0xff00B1D2)),
                //   ),
                //   onPressed: () => FirebaseAuth.instance.signOut(),
                // ),
              ],
            ),
          ),
        );
}
