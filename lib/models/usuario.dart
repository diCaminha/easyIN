import 'package:flutter/widgets.dart';

class Usuario {
  final String nome;
  final String email;

  Usuario({@required this.nome, @required this.email});

  Map<String, dynamic> toMap() {
    return {'nome': this.nome, 'email': this.email};
  }
}
