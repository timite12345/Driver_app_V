import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

import 'LoginPage1.dart';
import 'ProfilePage.dart';

class EditerProfilesPage extends StatefulWidget {
  @override
  State<EditerProfilesPage> createState() => _EditerProfilesPageState();
}

class _EditerProfilesPageState extends State<EditerProfilesPage> {
  //
  Future picImage() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  }

  Future pickImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  bool showPasswords = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.shade200,
        leading: const SizedBox(),
        // On Android it's false by default
        centerTitle: true,
        title: const Text(" Editer Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: Stack(children: <Widget>[
                ClipPath(
                  clipper: CustomShape(),
                  child: Container(
                    height: 150, //150
                    color: Colors.blue.shade200,
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 30), //10
                            height: 130, //140
                            width: 130,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 8, //8
                              ),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/tim.jpg"),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 120,
                              left: 60,
                              child: RawMaterialButton(
                                elevation: 10,
                                child: const Icon(Icons.add_a_photo),
                                padding: const EdgeInsets.all(1.0),
                                shape: const CircleBorder(),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            "Choisir une photo",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: [
                                                InkWell(
                                                    onTap: () => picImage(),
                                                    splashColor:
                                                        Colors.blue.shade200,
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Icon(
                                                              Icons.camera,
                                                              color: Colors.blue
                                                                  .shade200,
                                                            )),
                                                        const Text(
                                                          "Camera",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Colors
                                                                  .black87),
                                                        )
                                                      ],
                                                    )),
                                                InkWell(
                                                    onTap: () => pickImage(),
                                                    splashColor:
                                                        Colors.blue.shade200,
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Icon(
                                                              Icons.image,
                                                              color: Colors.blue
                                                                  .shade200,
                                                            )),
                                                        const Text(
                                                          "Gallery",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Colors
                                                                  .black87),
                                                        )
                                                      ],
                                                    )),
                                                InkWell(
                                                    onTap: () => picImage(),
                                                    splashColor:
                                                        Colors.blue.shade200,
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Icon(
                                                              Icons
                                                                  .remove_circle,
                                                              color: Colors.blue
                                                                  .shade200,
                                                            )),
                                                        const Text(
                                                          "Supprimer",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.red,
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                              )),
                        ],
                      ),
                    ],
                  ),
                )
              ]),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  texfield(
                    "Nom",
                    "Timite",
                    false,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  texfield(
                    "Prenom",
                    "Alassane",
                    false,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  texfield(
                    "Email",
                    "alassanekoudouss@gmail.com",
                    false,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  texfield(
                    "Mot de Passe",
                    "Timite",
                    true,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  texfield(
                    "Nom Medecin",
                    "Timite",
                    false,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  texfield(
                    "Contact",
                    "00216 52270118",
                    false,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  texfield(
                    "Adresse",
                    "Monastir",
                    false,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  texfield(
                    "Hopital de traitement",
                    "Fatouma Bourguiba",
                    false,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
            // Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10,)),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
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
                        margin: const EdgeInsets.only(left: 20, right: 40),
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
                          color: Colors.red,
                        ),
                        height: 40,
                        width: 120,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                Text("Annuler",
                                    style: GoogleFonts.ubuntu(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20, left: 20),
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
                    color: Colors.green,
                  ),
                  height: 40,
                  width: 120,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HommePage(),
                          ));
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Text("Valider",
                                style: GoogleFonts.ubuntu(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: MyBottomNavBar(),
    );
  }

  TextField texfield(
      String labelText, String placeHolder, bool isPasswordTexfield) {
    return TextField(
      obscureText: isPasswordTexfield ? showPasswords : false,
      decoration: InputDecoration(
          suffixIcon: isPasswordTexfield
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPasswords = !showPasswords;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.blue.shade300,
                  ),
                )
              : null,
          contentPadding: const EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeHolder,
          hintStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          )),
    );
  }
}
