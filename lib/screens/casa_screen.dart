import 'dart:math';

import 'package:flutter/material.dart';

class CasaScreen extends StatefulWidget {
  static const routeName = '/casa';

  @override
  _CasaScreenState createState() => _CasaScreenState();
}

class _CasaScreenState extends State<CasaScreen> {
  String codigo = "";
  bool exibirCodigo = false;

  _exibirCodigo() {
    codigo = Random.secure().nextInt(10000).toString();
    setState(() {
      exibirCodigo = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CASA 7", style: TextStyle(color: Colors.white),),

      backgroundColor: Colors.deepOrangeAccent,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Essa casa está sem morador!",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Para convidar um morador, clique no botão abaixo para gerar o código de entrada para a casa!",
                      style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    ),
                    const SizedBox(height: 30),
                    RaisedButton(
                      onPressed: _exibirCodigo,
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('Gerar Código',
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    exibirCodigo
                        ? Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  codigo,
                                  style: TextStyle(color: Colors.green),
                                ),
                                Icon(Icons.content_copy, color: Colors.green,),
                              ],
                            ),
                        )
                        : const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
