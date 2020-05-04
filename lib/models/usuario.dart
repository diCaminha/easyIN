import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class Usuario {
  final String id;
  final String nome;
  final String email;

  Usuario({@required this.id, @required this.nome, @required this.email});

  Map<String, dynamic> toMap() {
    return {'id': this.id, 'nome': this.nome, 'email': this.email};
  }
}
