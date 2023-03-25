import 'package:driver_app/LoginPage1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'EditerProfile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = FirebaseAuth.instance;

  Future picImage() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  }

  Future pickImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    PickedFile _imageFile;
    final ImagePicker _picker = ImagePicker();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.shade200,
        leading: const SizedBox(),
        // On Android it's false by default
        centerTitle: true,
        title: const Text("Profile"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditerProfilesPage(),
                ),
              );
            },
            child: const Text(
              "Editer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16, //16
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: MyBottomNavBar(),
      body: SingleChildScrollView(
          child: Column(children: [
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
                // mainAxisAlignment: MainAxisAlignment.end,
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
                                                          color: Colors
                                                              .blue.shade200,
                                                        )),
                                                    const Text(
                                                      "Camera",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Colors.black87),
                                                    ),
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
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Icon(
                                                        Icons.image,
                                                        color: Colors
                                                            .blue.shade200,
                                                      ),
                                                    ),
                                                    const Text(
                                                      "Gallery",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Colors.black87),
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
                                                          Icons.remove_circle,
                                                          color: Colors
                                                              .blue.shade200,
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
        const Text(
          "Timite Alassane Koudouss",
          style: TextStyle(
            fontSize: 22, // 22
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5), //5
        const Text(
          "alassanekoudouss@gmail.com",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Color(0xFF8492A2),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              foregroundColor: Colors.grey.shade300,
            ),
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.person, color: Colors.black, size: 25),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    "Mon Compte",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              foregroundColor: Colors.grey.shade300,
            ),
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.notifications, color: Colors.black, size: 25),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    "Notification",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              foregroundColor: Colors.grey.shade300,
            ),
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.settings, color: Colors.black, size: 25),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    "Parametre",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              foregroundColor: Colors.grey.shade300,
            ),
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.help, color: Colors.black, size: 25),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    "Aide",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              foregroundColor: Colors.grey.shade300,
            ),
            onPressed: () async {
              try {
                await _auth.signOut().then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HommePage(),
                    ),
                  );
                });
              } on FirebaseAuthException catch (e) {}
            },
            child: Row(
              children: const [
                Icon(Icons.logout_outlined, color: Colors.black, size: 25),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    "Se Deconnecter",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
      ])),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
