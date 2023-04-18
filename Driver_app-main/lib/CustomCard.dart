// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:driver_app/API/getAllMission.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    Key? key,
    required this.titre,
  }) : super(key: key);

  final String titre;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // margin: const EdgeInsets.only(top: 5, bottom: 5, right: 15),
        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // decoration: const BoxDecoration(
        //     color: Color(0xFFFFEFEE),
        //     borderRadius: BorderRadius.only(
        //       topRight: Radius.circular(20),
        //       topLeft: Radius.circular(20),
        //       bottomRight: Radius.circular(20),
        //     )),
        body: Container(
      child: ElevatedButton(
        onPressed: () {},
        child: FutureBuilder(
            future: getAllMission(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Mission> missions = snapshot.data as List<Mission>;
                return ListView.builder(
                    itemCount: missions.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 25,
                                  ),
                                  title: Text(
                                    titre,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    'Vous avez une nouvelle mission à effectuer',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  trailing: Text(
                                    'Détails',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ))
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
            }),
      ),
    ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
