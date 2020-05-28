import 'package:easyin/models/enum/tipo_entrada.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VisitsCard extends StatelessWidget {
  const VisitsCard(
      {@required this.data,
      @required this.casa,
      @required this.nome,
      @required this.tipoEntrada,
      @required this.quantidadePessoa});

  final String data;
  final String casa;
  final String nome;
  final TipoEntrada tipoEntrada;
  final int quantidadePessoa;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          title: Text(this.data),
          leading: Column(
            children: <Widget>[
              Icon(
                Icons.home,
                color: Colors.orange,
              ),
              Text(this.casa),
            ],
          ),
          subtitle: Text(this.nome),
          trailing: Column(
            children: <Widget>[
              Icon(
                  this.tipoEntrada == TipoEntrada.CARRO
                      ? Icons.drive_eta
                      : this.tipoEntrada == TipoEntrada.MOTO
                          ? Icons.motorcycle
                          : Icons.person,
                  color: Colors.orange),
              Text(this.quantidadePessoa.toString())
            ],
          ),
        ));
  }
}
