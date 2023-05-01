import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Chauffeur {
  String id;
  String nom;
  String prenom;
  String email;
  String tel;
  String adresse;
  String permis;

  Chauffeur({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.tel,
    required this.adresse,
    required this.permis,
  });

  factory Chauffeur.fromJson(Map<String, dynamic> json) {
    return Chauffeur(
      id: json['id'].toString(),
      nom: json['nom'].toString(),
      prenom: json['prenom'].toString(),
      email: json['email'].toString(),
      tel: json['tel'].toString(),
      adresse: json['adresse'].toString(),
      permis: json['permis'].toString(),
    );
  }
}

final String apiUrl = "http://192.168.1.134:8000/api/chauffeur";

Future<List<Chauffeur>> getAllChauffeurs() async {
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    final item = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Chauffeur> users = item.map<Chauffeur>((json) {
      return Chauffeur.fromJson(json);
    }).toList();
    return users;
    // responseData = ResponseData.fromJson(item).cast<Map<String,dynamic>>();
    // notifyListeners();
  } else {
    throw Exception('Failed to load');
  }
}
