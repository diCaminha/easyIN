import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyin/models/enum/tipo_entrada.dart';
import 'package:easyin/models/visita.dart';
import 'package:easyin/screens/concierge_screen/visits_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConciergePage extends StatefulWidget {
  @override
  _ConciergePageState createState() => _ConciergePageState();
}

class _ConciergePageState extends State<ConciergePage> {
  bool isLoad = false;
  List<Visita> _visitas;
  @override
  Widget build(BuildContext context) {
    if (!isLoad) {
      getVisitas().then((value) => {
            setState(() {
              _visitas.addAll(value);
              isLoad = true;
            })
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Porteiro"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _visitas.length,
              itemBuilder: (context, index) => Column(
                children: <Widget>[
                  VisitsCard(
                    data: _visitas[index].data,
                    casa: _visitas[index].casa,
                    nome: _visitas[index].pessoaOuPlaca,
                    tipoEntrada: _visitas[index].tipoEntrada,
                    quantidadePessoa: _visitas[index].quantidadeDePessoas,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FloatingActionButton(
              child: Icon(
                Icons.chat,
                color: Colors.orange,
              ),
              onPressed: null,
            ),
          )
        ],
      ),
    );
  }

  Future<List<Visita>> getVisitas() async {
    var query = Firestore.instance.collection('visitas').orderBy('nome');

    var documents = await query.getDocuments();

    final visitas = <Visita>[];

    for (var document in documents.documents) {
      final casa = Visita.fromJson(document.data);
      visitas.add(casa);
    }
    return visitas;
  }
}
