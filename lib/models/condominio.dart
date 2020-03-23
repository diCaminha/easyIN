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
}
