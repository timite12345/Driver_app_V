import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Mission {
  String id;
  String nom;
  String prenom;
  String email;
  String estUrgent;
  String date_Dep;
  String adresse_Dep;
  String condTransp;
  String create_at;
  String update_at;

  Mission({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.estUrgent,
    required this.date_Dep,
    required this.adresse_Dep,
    required this.condTransp,
    required this.create_at,
    required this.update_at,
  });

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      id: json['id'].toString(),
      nom: json['nom'].toString(),
      prenom: json['prenom'].toString(),
      email: json['email'].toString(),
      estUrgent: json['estUrgent'].toString(),
      date_Dep: json['date_Dep'].toString(),
      adresse_Dep: json['adresse_Dep'].toString(),
      condTransp: json['condTransp'].toString(),
      create_at: json['create_at'].toString(),
      update_at: json['update_at'].toString(),
    );
  }
}

final String apiUrl = "http://192.168.1.134:8000/api/mission";

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
