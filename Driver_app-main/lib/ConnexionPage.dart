// ignore_for_file: unnecessary_const

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'LoginPage1.dart';
import 'ProfilePage.dart';
import 'main.dart';

class ConnexionPage extends StatelessWidget {
  const ConnexionPage({Key? key}) : super(key: key);

  _LoginState createState() => _LoginState();

  @override
  Widget build(BuildContext context) => ProfilePage();
}

//////
class _LoginState extends State<ProfilePage> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email;
  var password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    // _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var textStyle = const TextStyle(
      fontSize: 63,
      fontWeight: FontWeight.bold,
      fontFamily: "Biscuit",
      color: Colors.white,
      // fontStyle: FontStyle.italic,
    );
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: DrawClip2(),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.9,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            const Color(0xffa58fd2),
                            const Color(0xffddc3fc)
                          ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.bottomRight)),
                    ),
                  ),
                  ClipPath(
                    clipper: DrawClip(),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.9,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        const Color(0xffddc3fc),
                        const Color(0xff91c5fc)
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Connexion",
                          style: textStyle,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        input("Email", false),
                        input("Mot de Passe", true),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HommePage(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 40,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                height: 40,
                                child: Center(
                                    child: Text(
                                  "Se connecter",
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ),
                            )),
                        Text("Forget your password",
                            style: GoogleFonts.ubuntu(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
              Text("Or Connect with ",
                  style: GoogleFonts.ubuntu(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HommePage(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.blue,
                              offset: Offset(3.0, 3.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-3.0, -3.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        height: 40,
                        width: 150,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                              children: [
                                const FaIcon(FontAwesomeIcons.facebook,
                                    color: Colors.white),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text("Facebook",
                                    style: GoogleFonts.ubuntu(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HommePage(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.blue,
                              offset: Offset(3.0, 3.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-3.0, -3.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.orange,
                        ),
                        height: 40,
                        width: 160,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                              children: [
                                const FaIcon(FontAwesomeIcons.facebook,
                                    color: Colors.white),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("Autres",
                                    style: GoogleFonts.ubuntu(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Vous n'avez pas de Compte ?",
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HommePage(),
                          ),
                        );
                      },
                      child: Text("Creez Un Compte",
                          style: GoogleFonts.ubuntu(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ))),
                ],
              )
            ],
          ),
        ));
  }

  Widget input(String hint, bool pass) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: TextFormField(
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: GoogleFonts.ubuntu(color: Colors.grey),
                  contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
                  prefixIcon: pass
                      ? const Icon(
                          Icons.lock_clock_outlined,
                          color: Colors.grey,
                        )
                      : const Icon(Icons.person_outlined, color: Colors.grey),
                  suffixIcon: pass
                      ? null
                      : const Icon(Icons.assignment_turned_in_rounded,
                          color: Colors.greenAccent),
                  border: const UnderlineInputBorder(
                      borderSide: BorderSide.none)))),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class DrawClip extends CustomClipper<Path> {
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.80);
    path.cubicTo(size.width / 4, size.height, 3 * size.width / 4,
        size.height / 2, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class DrawClip2 extends CustomClipper<Path> {
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.80);
    path.cubicTo(size.width / 4, size.height, 3 * size.width / 4,
        size.height / 2, size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
