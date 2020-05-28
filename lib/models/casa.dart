import 'package:flutter/material.dart';

class Casa {
  final String id;
  final String nome;
  final String status;


  Casa(
      {@required this.id,
      @required this.nome,
      @required this.status});

  static fromJson(Map<String, dynamic> data) {
    return {
      'id': data['id'],
      'nome': data['nome'],
      'status': data['status']
    };
  }
}
