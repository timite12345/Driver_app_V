import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:driver_app/WelcomePage.dart';

// import 'package:flutter/material.dart';
// import 'package:tutorial_app/screen/login.dart';
// import 'package:tutorial_app/screen/home.dart';
//import 'package:projet_flutter/SocialPage.dart';

const d_red = Color(0xFFE9717D);
const Val = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get title => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckAuth(),
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = WelcomePage();
    } else {
      child = WelcomePage();
    }
    return Scaffold(
      body: child,
    );
  }
}
