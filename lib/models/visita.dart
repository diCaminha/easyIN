import 'package:easyin/models/enum/tipo_entrada.dart';
import 'package:flutter/cupertino.dart';

class Visita {
  String id;
  String data;
  String pessoaOuPlaca;
  TipoEntrada tipoEntrada;
  String quantidadeDePessoas;
  bool entrou;

  Visita({
    this.id,
    @required this.data,
    @required this.pessoaOuPlaca,
    @required this.tipoEntrada,
    @required this.quantidadeDePessoas,
    this.entrou
  });

  Visita.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      data = json['data'];
      pessoaOuPlaca = json['pessoaOuPlaca'];
      tipoEntrada = _toTipoEntrada(json['tipoEntrada']);
      quantidadeDePessoas = json['quantidadeDePessoas'];
      entrou = json['entrou'];
  }

  TipoEntrada _toTipoEntrada(String tipoEntrada) {
    if (tipoEntrada == '0') {
      return TipoEntrada.CARRO;
    } else if (tipoEntrada == '1') {
      return TipoEntrada.MOTO;
    } else {
      return TipoEntrada.PESSOA;
    }
  }
}