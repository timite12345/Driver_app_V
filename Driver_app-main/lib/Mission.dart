// import 'package:driver_app/CustomCards.dart';
// import 'package:flutter/material.dart';

// import 'CategorySelector.dart';
// import 'CustomCard.dart';

// class Mission extends StatefulWidget {
//   const Mission({super.key});

//   @override
//   State<Mission> createState() => _MissionState();
// }

// class _MissionState extends State<Mission> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.menu),
//           iconSize: 30.0,
//           color: Colors.white,
//           onPressed: () {},
//         ),
//         title: const Text(
//           'Mission',
//           style: TextStyle(
//             fontSize: 28.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         elevation: 0.0,
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.search),
//             iconSize: 30.0,
//             color: Colors.white,
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           const CategorySelector(), //Cette classe permet de scroller la barre de navigation d'en haut
//           Expanded(
//             child: Container(
//               //height: 500,
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   )),
//               child: ListView(children: const [
//                 CustomCard(
//                   titre: 'Cocody-plateau',
//                 ),
//                 // CustomCard(
//                 //   titre: 'Marcory-Cocody',
//                 // ),
//                 // CustomCard(
//                 //   titre: 'Yopougon-Cocody',
//                 // ),
//                 // CustomCard(
//                 //   titre: 'Angre-Plateau',
//                 // ),
//                 // CustomCard(
//                 //   titre: 'Abobo-Angre',
//                 // ),
//                 // CustomCard(
//                 //   titre: 'Adjame-Cocody',
//                 // ),
//                 // CustomCard(
//                 //   titre: 'Bingerville-Deux Plateaux',
//                 // ),
//                 // CustomCard(
//                 //   titre: 'Port-Bouet-Koumassi',
//                 // ),
//                 // CustomCard(
//                 //   titre: 'Marcory-Treichville',
//                 // ),
//               ]),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
  final String apiUrl = "http://192.168.1.134:8000/api/chauffeur";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mission'),
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
                              Text(users[index].tel),
                              Text(users[index].email),
                              Text(users[index].adresse),
                              Text(users[index].permis),
                              Text(users[index].estDisponible),
                              Text(users[index].create_at),
                              Text(users[index].update_at),
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
