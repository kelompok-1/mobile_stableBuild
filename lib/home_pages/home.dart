import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 25.0,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Hallo, ",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Color(0xff00B1D2),
                      // color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      user.email!,
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: Colors.black,
                        // color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Mata Pelajaran",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      // color: Color(0xff00B1D2),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
