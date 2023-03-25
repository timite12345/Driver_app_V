import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:driver_app/LoginPage1.dart';
import 'package:flutter/material.dart';
import 'GpsPage.dart';
import 'ProfilePage.dart';
import 'SocialPage.dart';
import 'animation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'main.dart';

class ChoixPage extends StatefulWidget {
  const ChoixPage({Key? key}) : super(key: key);

  @override
  _ChoixPageState createState() => _ChoixPageState();
}

class _ChoixPageState extends State<ChoixPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white.withOpacity(0),
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Text("Que voulez-vous faire ?",
              style: GoogleFonts.ubuntu(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "Maps",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SocialPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.shade300,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_hospital,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "Ambulances",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SocialPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.indigo,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_hospital_rounded,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "Hospital",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
              // Column(
              //   children: [
              //     ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //           primary: Colors.blueGrey,
              //           shape: const StadiumBorder(),
              //           padding:
              //               EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,

              //         // ignore: prefer_const_literals_to_create_immutables
              //         children: [
              //           const SizedBox(
              //             height: 30,
              //           ),
              //           const Text(
              //             "Se Deconnecter",
              //             style: TextStyle(
              //               fontSize: 15,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ],
              //       ),
              //       onPressed: () async {
              //         try {
              //           await _auth.signOut().then((value) {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => HommePage(),
              //               ),
              //             );
              //           });
              //         } on FirebaseAuthException catch (e) {}
              //       },
              //     ),
              //   ],
              // ),
              // GestureDetector(
              //   onTap: () async {
              //     try {
              //       await _auth.signOut().then((value) {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => HommePage(),
              //           ),
              //         );
              //       });
              //     } on FirebaseAuthException catch (e) {}
              //   },
              //   child: Container(
              //       color: Colors.yellow.shade600,

              //       padding: const EdgeInsets.all(8),
              //       // Change button text when light changes state.
              //       child: Text("Deconnecter",
              //           style: GoogleFonts.ubuntu(
              //             color: Colors.red,
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //           ))),
              // ),
            ],
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 50,
              crossAxisSpacing: 10,
            ),
          ),
        ),
      ),
    );
  }
}
