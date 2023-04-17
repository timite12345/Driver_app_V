// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.titre,
  }) : super(key: key);

  final String titre;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 5, bottom: 5, right: 15),
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // decoration: const BoxDecoration(
      //     color: Color(0xFFFFEFEE),
      //     borderRadius: BorderRadius.only(
      //       topRight: Radius.circular(20),
      //       topLeft: Radius.circular(20),
      //       bottomRight: Radius.circular(20),
      //     )),
      child: TextButton(
        onPressed: () {},
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
          ),
          title: Text(
            titre,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Vous avez une nouvelle mission à effectuer',
            style: TextStyle(fontSize: 15),
          ),
          trailing: Text(
            'Détails',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ),
    );
  }
}
