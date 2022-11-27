// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolen/drawer/my_header_drawer.dart';
import 'package:skoolen/home_pages/dashboard.dart';
import 'package:skoolen/home_pages/home.dart';
import 'package:skoolen/home_pages/module.dart';
import 'package:skoolen/home_pages/quiz.dart';
import 'package:skoolen/home_pages/settings.dart';
import 'package:skoolen/pages/condition_policy_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.amber,
          title: Text("Sign Out"),
          content: Text("Apakah anda yakin ingin keluar?"),
          actions: [
            MaterialButton(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              child: Text("Ok"),
            ),
            MaterialButton(
              color: Colors.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
          ],
        );
      },
    );
  }

  final user = FirebaseAuth.instance.currentUser!;
  final currentUser = FirebaseAuth.instance;
  var currentPage = drawerSections.Dashboard;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var container;
    String title = "Title";
    if (currentPage == drawerSections.Dashboard) {
      container = DashboardPage();
      title = "Dashboard";
    } else if (currentPage == drawerSections.Videos) {
      container = UserModule();
      title = "Videos";
    } else if (currentPage == drawerSections.Quiz) {
      container = UserQuiz();
      title = "Quiz";
    } else if (currentPage == drawerSections.Modul) {
      container = UserModule();
      title = "Modul";
    } else if (currentPage == drawerSections.Settings) {
      container = UserSettings();
      title = "Settings";
    } else if (currentPage == drawerSections.ConditionPolicy) {
      container = conditionPolicy();
      title = "Condition & Policy";
    }
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Color(0xff00B1D2),
            // color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
        backgroundColor: Colors.grey[200],
        elevation: 1,
      ),
      body: container,
      drawer: Drawer(
        backgroundColor: Colors.grey[200],
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .where("uid", isEqualTo: currentUser.currentUser!.uid)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        var data = snapshot.data!.docs[i];
                        return UserAccountsDrawerHeader(
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            color: Color(0xff05B1D2),
                          ),
                          accountName: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                data['username'],
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors.white,
                                  // color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          accountEmail: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(data['email']),
                            ],
                          ),
                          currentAccountPicture: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 18,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/Logo Biru.png',
                                width: 50,
                                height: 80,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              // MyHeaderDrawer(),
              MyDrawerList(),
              SizedBox(height: 50),
              MaterialButton(
                splashColor: Colors.amber,
                highlightColor: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                onPressed: () {
                  _showDialog();
                },
                color: Colors.amber,
                child: Text("Sign Out"),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 0,
      ),
      child: Column(
        children: [
          menuItem(1, "Dashboard", Icons.dashboard,
              currentPage == drawerSections.Dashboard ? true : false),
          menuItem(2, "Videos", Icons.video_call,
              currentPage == drawerSections.Videos ? true : false),
          menuItem(3, "Quiz", Icons.quiz,
              currentPage == drawerSections.Quiz ? true : false),
          menuItem(4, "Modul", Icons.document_scanner,
              currentPage == drawerSections.Modul ? true : false),
          menuItem(5, "Settings", Icons.settings,
              currentPage == drawerSections.Settings ? true : false),
          menuItem(6, "Condition & Policy", Icons.privacy_tip,
              currentPage == drawerSections.ConditionPolicy ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.amber[400] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = drawerSections.Dashboard;
            } else if (id == 2) {
              currentPage = drawerSections.Videos;
            } else if (id == 3) {
              currentPage = drawerSections.Quiz;
            } else if (id == 4) {
              currentPage = drawerSections.Modul;
            } else if (id == 5) {
              currentPage = drawerSections.Settings;
            } else if (id == 6) {
              currentPage = drawerSections.ConditionPolicy;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                    // color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum drawerSections {
  Dashboard,
  Videos,
  Quiz,
  Modul,
  Settings,
  ConditionPolicy,
}
