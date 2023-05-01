import 'package:flutter/material.dart';
import 'API/getAllChauffeurs.dart';

class ChauffeurListe extends StatefulWidget {
  const ChauffeurListe({Key? key}) : super(key: key);

  @override
  _ChauffeurListe createState() => _ChauffeurListe();
}

class _ChauffeurListe extends State<ChauffeurListe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listes Chauffeurs'),
        ),
        body: Container(
          color: Colors.grey,
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<List<Chauffeur>>(
            future: getAllChauffeurs(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Chauffeur> users = snapshot.data as List<Chauffeur>;
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
                              users[index].prenom,
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
                              users[index].adresse,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              users[index].permis,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                child: const Text(
                                  'Contacter',
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
