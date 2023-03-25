import 'package:flutter/material.dart';
import 'package:driver_app/ProfilePage.dart';
import 'package:driver_app/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ChoixPage.dart';
import 'ConnexionPage.dart';
import 'LoginPage1.dart';
import 'Mission.dart';
import 'SocialPage.dart';
import 'animation.dart';
import 'package:driver_app/Variable.dart';
import 'package:driver_app/SocialPage.dart';
import 'package:driver_app/LoginPage1.dart';

// ignore: use_key_in_widget_constructors
class SocialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 10,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                duration: 100,
                children: Container(
                  height: 260,
                  width: 600,
                  child: Image.asset('images/im2.png'),
                ),
              ),
              DelayedAnimation(
                  duration: 1000,
                  children: Container(
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 40,
                            horizontal: 30,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Se Connecter",
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Biscuit",
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Connectez Vous en Tant que :",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          )))),
              DelayedAnimation(
                  duration: 700,
                  children: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 40,
                      ),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HommePage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                primary: Colors.indigo,
                                padding: const EdgeInsets.all(13),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.person,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Patient",
                                    style: GoogleFonts.poppins(
                                      // color : Colors.black ,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(height: 30),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HommePage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                primary: Colors.blueGrey,
                                padding: const EdgeInsets.all(13),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.person),
                                  SizedBox(width: 10),
                                  Text(
                                    "Medecin",
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(height: 30),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Mission(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                primary: Colors.blueAccent,
                                padding: const EdgeInsets.all(15),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.person),
                                  SizedBox(width: 10),
                                  Text(
                                    "Chauffeur",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(height: 30),
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
