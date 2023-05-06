// ignore_for_file: unused_import, prefer_const_constructors

import 'package:driver_app/GpsPage.dart';
import 'package:flutter/material.dart';
import 'API/getAllHopital.dart';
import 'API/getAllMission.dart';

class HopitalListe extends StatefulWidget {
  const HopitalListe({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HopitalListe createState() => _HopitalListe();
}

class _HopitalListe extends State<HopitalListe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listes Hopitaux'),
        ),
        body: Container(
          color: Colors.grey,
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<List<Hopital>>(
            future: getAllHopital(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Hopital> users = snapshot.data as List<Hopital>;
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(10),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text(
                              users[index].nom,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              users[index].adresse,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              users[index].email,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              users[index].tel,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              users[index].type,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent),
                                child: const Text(
                                  'Chercher',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }
              if (snapshot.hasError) {
                // ignore: avoid_print
                print(snapshot.error.toString());
                return const Text('error');
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
