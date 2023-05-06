// ignore_for_file: duplicate_import, implementation_imports, unused_import, unnecessary_null_comparison, prefer_const_constructors

import 'package:driver_app/LoginPage1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user == null ? HommePage() : HommePage();
  }
}
