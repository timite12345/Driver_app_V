import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Hopital {
  String id;
  String nom;
  String adresse;
  String email;
  String tel;
  String type;

  Hopital({
    required this.id,
    required this.nom,
    required this.adresse,
    required this.email,
    required this.tel,
    required this.type,
  });

  factory Hopital.fromJson(Map<String, dynamic> json) {
    return Hopital(
      id: json['id'].toString(),
      nom: json['nom'].toString(),
      adresse: json['adresse'].toString(),
      email: json['email'].toString(),
      tel: json['tel'].toString(),
      type: json['type'].toString(),
    );
  }
}

final String apiUrl = "http://192.168.1.134:8000/api/hopital";

Future<List<Hopital>> getAllHopital() async {
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    final item = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Hopital> users = item.map<Hopital>((json) {
      return Hopital.fromJson(json);
    }).toList();
    return users;
  } else {
    throw Exception('Failed to load');
  }
}
