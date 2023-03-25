import 'package:flutter/material.dart';
import 'package:driver_app/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'SocialPage.dart';
import 'animation.dart';

class WelcomePage extends StatelessWidget {
  //get vertical => null;

  // get horizontal => null;

  @override
  Widget build(BuildContext context) {
    var top;
    var textAlign;
    var GoogleFonts;
    return Scaffold(
      backgroundColor: const Color(0xFFEDECF2),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 100,
              horizontal: 5,
            ),
            child: Column(children: [
              DelayedAnimation(
                duration: 1000,
                children: SizedBox(
                  height: 340,
                  child: Image.asset("images/im1.png"),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              DelayedAnimation(
                duration: 1500,
                children: Container(
                  margin: const EdgeInsets.only(
                    top: 60,
                    bottom: 30,
                  ),
                  child: const Text(
                    "Bienvenue",
                    style: TextStyle(
                      fontSize: 63,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Biscuit",
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              DelayedAnimation(
                duration: 1600,
                children: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  width: 350,
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            shape: const StadiumBorder(),
                            padding: EdgeInsets.all(13)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Get STARTED",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SocialPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
