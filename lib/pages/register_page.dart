// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_interpolation_to_compose_strings, prefer_const_constructors, prefer_is_empty, sort_child_properties_last, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolen/pages/condition_policy_page.dart';
import 'package:skoolen/pages/login_page.dart';
import 'package:skoolen/pages/onboarding_page.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _btnEmailActive = false;
  bool _btnPasswordActive = false;

  // hexa colors
  Color HexaColor(String strcolor, {int opacity = 15}) {
    //opacity is optional value
    strcolor = strcolor.replaceAll("#", ""); //replace "#" with empty value
    String stropacity =
        opacity.toRadixString(16); //convert integer opacity to Hex String
    return Color(int.parse("$stropacity$stropacity" + strcolor, radix: 16));
    //here color format is 0xFFDDDDDD, where FF is opacity, and DDDDDD is Hex Color
  }

  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // appBar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Text(
            'Daftar',
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 1,
          backgroundColor: Colors.grey[200],
          leading: IconButton(
            splashRadius: 19,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => onboardingPage()),
              );
            },
          ),
        ),
      ),

      body: SafeArea(
        child: Center(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              // // Logo
              // Image.asset(
              //   "assets/pictures/Logo Biru.png",
              //   scale: 6,
              // ),

              SizedBox(height: 15),

              // login icon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/login_icon.png", scale: 7),
                  ],
                ),
              ),

              SizedBox(height: 15),

              // Yay! Kamu kembali
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Semua bisa cerdas',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 5),

              // Yuk, lanjutin belajar di Skoolen untuk capai tujuanmu.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      'Di Skoolen cara belajarnya beda. Yuk, cobain!',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Masukkin E-Mail atau Nomor HP
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      'Masukkin E-Mail atau Nomor HP',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // email textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  cursorColor: const Color(0xffFDDB27),
                  controller: _emailController,
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
                    hintText: 'Ketik salah satu di sini',
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

              SizedBox(height: 30),

              Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                width: double.infinity,
                child: ElevatedButton(
                  child: Text(
                    "Daftar",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _btnEmailActive == true ? () {} : null,
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

              SizedBox(height: 30),

              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 25.0, right: 10.0),
                          child: Divider(
                            color: Colors.black,
                            height: 0,
                          ),
                        ),
                      ),
                      Text(
                        "atau daftar dengan",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 25.0),
                          child: Divider(
                            color: Colors.black,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 25),

              // Sign Up Buttons
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                width: double.infinity,
                child: SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                width: double.infinity,
                child: SignInButton(
                  Buttons.Facebook,
                  text: "Sign up with Facebook",
                  onPressed: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                width: double.infinity,
                child: SignInButton(
                  Buttons.AppleDark,
                  text: "Sign up with Apple",
                  onPressed: () {},
                ),
              ),

              SizedBox(height: 15),

              // Belum punya akun? Daftar Sekarang
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Udah punya akun?',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      // highlightColor: Colors.amber,
                      highlightColor: Color(0x1000B1D2),
                      splashColor: Color(0x4000B1D2),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: Text(
                          textAlign: TextAlign.start,
                          'Masuk',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Color(0xff00b1d2),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => loginPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Syarat Ketentuan & Kebijakan Privasi
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Dengan masuk atau daftar Skoolen, saya menyetujui : ',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      // highlightColor: Colors.amber,
                      highlightColor: Color(0x1000B1D2),
                      splashColor: Color(0x4000B1D2),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: Text(
                          textAlign: TextAlign.start,
                          'Syarat Ketentuan & Kebijakan Privasi',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Color(0xff00b1d2),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => conditionPolicy(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Column(
              //   children: <Widget>[
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         new Container(
              //           margin: const EdgeInsets.only(left: 0.0, right: 10.0),
              //           child: SignInButton(
              //             Buttons.Google,
              //             text: "Sign in with Google",
              //             onPressed: () {},
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(20),
              //             ),
              //           ),
              //         ),
              //         new Container(
              //           margin: const EdgeInsets.only(left: 0.0, right: 10.0),
              //           child: SignInButton(
              //             Buttons.Facebook,
              //             mini: true,
              //             onPressed: () {},
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(20),
              //             ),
              //           ),
              //         ),
              //         new Container(
              //           margin: const EdgeInsets.only(left: 0.0, right: 10.0),
              //           child: SignInButton(
              //             Buttons.AppleDark,
              //             mini: true,
              //             onPressed: () {},
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(20),
              //             ),
              //           ),
              //         ),
              //       ],
              //     )
              //   ],
              // ),

              SizedBox(height: 75),
            ],
          ),
        ),
      ),
    );
  }
}
