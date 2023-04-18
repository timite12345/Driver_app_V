import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Mission {
  String id;
  String nom;
  String prenom;
  String tel;
  String email;
  String adresse;
  String permis;
  String estDisponible;
  String create_at;
  String update_at;

  Mission({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.tel,
    required this.email,
    required this.adresse,
    required this.permis,
    required this.estDisponible,
    required this.create_at,
    required this.update_at,
  });

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      id: json['id'].toString(),
      nom: json['nom'].toString(),
      prenom: json['prenom'].toString(),
      tel: json['tel'].toString(),
      email: json['email'].toString(),
      adresse: json['adresse'].toString(),
      permis: json['permis'].toString(),
      estDisponible: json['estDisponible'].toString(),
      create_at: json['create_at'].toString(),
      update_at: json['update_at'].toString(),
    );
  }
}

final String apiUrl = "http://192.168.1.134:8000/api/chauffeur";

Future<List<Mission>> getAllMission() async {
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    final item = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Mission> users = item.map<Mission>((json) {
      return Mission.fromJson(json);
    }).toList();
    return users;
    // responseData = ResponseData.fromJson(item).cast<Map<String,dynamic>>();
    // notifyListeners();
  } else {
    throw Exception('Failed to load');
  }
}
