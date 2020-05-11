import 'package:flutter/material.dart';

class Condominio {
  final String id;
  final String nomeSindico;
  final String nome;
  final String endereco;
  final int numCasas;

  Condominio(
      {@required this.id,
      @required this.nomeSindico,
      @required this.nome,
      @required this.endereco,
      @required this.numCasas});

  static fromJson(Map<String, dynamic> data) {
    return {
      'id': data['id'],
      'nomeSindico': data['nomeSindico'],
      'nome': data['nome'],
      'endereco': data['endereco'],
      'numCasas': data['numCasas']
    };
  }
}
