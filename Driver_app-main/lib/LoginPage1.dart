// ignore_for_file: unnecessary_const, avoid_print, unused_field, unused_element, unused_local_variable, prefer_const_constructors

import 'package:driver_app/SocialPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HommePage extends StatefulWidget {
  const HommePage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

//////
class _LoginState extends State<HommePage> {
  final bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  bool hasPawdError = false;
  String passwordError = "";
  bool hasEmailError = false;
  String emailError = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var textStyle = const TextStyle(
      fontSize: 55,
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
                  Form(
                    key: _formKey,
                    child: Container(
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
                            height: 10,
                          ),
                          inputemail("Email", false, _emailController),
                          inputpassword(
                              "Mot de Passe", true, _passwordController),
                          const SizedBox(
                            height: 5,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    print(_emailController.text);
                                    print(_passwordController.text);
                                    await _auth
                                        .signInWithEmailAndPassword(
                                            email: _emailController.text,
                                            password: _passwordController.text)
                                        .then((value) {
                                      print(value.user!.uid);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SocialPage(),
                                        ),
                                      );
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    print(e.code);
                                    if (e.code.contains('wrong-password')) {
                                      setState(() {
                                        hasPawdError = true;
                                        passwordError =
                                            "mot de passe incorrect";
                                      });
                                    } else if (e.code
                                            .contains('user-not-found') ||
                                        e.code.contains(
                                            'There is no user record corresponding to this identifier. The user may have been deleted.')) {
                                      setState(() {
                                        hasEmailError = true;
                                        emailError = "Email incorrect";
                                      });
                                    }
                                  } finally {
                                    if (!_formKey.currentState!.validate()) {
                                      setState(() {
                                        hasEmailError = false;
                                        hasPawdError = false;
                                      });
                                    }
                                  }
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 15,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  height: 40,
                                  child: Center(
                                      child: Text(
                                    "Se Connecter",
                                    style: GoogleFonts.ubuntu(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 0,
                ),
              )
            ],
          ),
        ));
  }

  Widget inputemail(String hint, bool pass, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: TextFormField(
              controller: controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                } else if (value.length < 8) {
                  return 'Please enter  correct mail';
                } else if (hasEmailError) {
                  return emailError;
                }
                return null;
              },
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

  Widget inputpassword(
      String hint, bool pass, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: TextFormField(
              controller: controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                } else if (value.length < 6) {
                  return 'Please enter  correct Password';
                } else if (hasPawdError) {
                  return passwordError;
                }
                return null;
              },
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
