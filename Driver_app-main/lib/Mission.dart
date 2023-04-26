import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'API/getAllMission.dart';
import 'SocialPage.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  //final String apiUrl = "http://192.168.1.134:8000/api/mission";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Missions'),
        ),
        body: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SocialPage(),
              ),
            );
          },
          child: Container(
            color: Colors.grey,
            padding: const EdgeInsets.all(8),
            child: FutureBuilder<List<Mission>>(
              future: getAllMission(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Mission> users = snapshot.data as List<Mission>;
                  return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(8),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text(users[index].nom),
                              Text(users[index].prenom),
                              Text(users[index].email),
                              Text(users[index].estUrgent),
                              Text(users[index].date_Dep),
                              Text(users[index].adresse_Dep),
                              Text(users[index].condTransp),
                            ],
                          ),
                        );
                      });
                }
                if (snapshot.hasError) {
                  print(snapshot.error.toString());
                  return Text('error');
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ));
  }
}
