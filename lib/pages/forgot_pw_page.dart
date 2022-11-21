import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _forgotPasswordController =
      TextEditingController();
  bool _btnEmailActive = false;
  @override
  void dispose() {
    _forgotPasswordController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _forgotPasswordController.text.trim(),
      );
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
                "Tautan reset kata sandi sudah dikirim, coba cek email kamu"),
          );
        },
      );
    } on FirebaseAuthException catch (error) {
      if (error.message == "The email address is badly formatted.") {
        Fluttertoast.showToast(
          msg: "Masukkin E-Mail yang benar",
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.grey[500],
        );
      } else if (error.message ==
          "There is no user record corresponding to this identifier. The user may have been deleted.") {
        Fluttertoast.showToast(
          msg: "Pengguna nggak terdaftar",
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.grey[500],
        );
      } else {
        Fluttertoast.showToast(
          msg: error.message.toString(),
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.grey[500],
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey[200],
        title: Text(
          "Lupa kata sandi",
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              textAlign: TextAlign.center,
              "Masukkin email kamu, nanti bakal kami kirimin link reset kata sandi",
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 15),

          // email textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              cursorColor: const Color(0xffFDDB27),
              controller: _forgotPasswordController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person_2,
                  color: Color(0xff00B1D2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff00B1D2)),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Masukkin email kamu',
                fillColor: Colors.grey[200],
                filled: true,
              ),
              onChanged: (value) {
                setState(() {
                  _btnEmailActive = value.length >= 1 ? true : false;
                });
              },
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                "Reset kata sandi",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: _btnEmailActive == true ? passwordReset : null,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xff00b1d2),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
