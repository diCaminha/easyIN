import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyin/models/casa.dart';
import 'package:easyin/models/condominio.dart';
import 'package:easyin/models/usuario.dart';
import 'package:flutter/material.dart';

class CasasProvider with ChangeNotifier {
  CasasProvider({this.userId});

  final String userId;
  List<Casa> _casas = [
    Casa(id: '11111', nome: 'CASA 1', status: 'SEM MORADOR'),
    Casa(id: '11112', nome: 'CASA 2', status: 'SEM MORADOR'),
    Casa(id: '11113', nome: 'CASA 3', status: 'OCUPADA'),
    Casa(id: '11114', nome: 'CASA 4', status: 'SEM MORADOR'),
    Casa(id: '11115', nome: 'CASA 5', status: 'OCUPADA'),
    Casa(id: '11116', nome: 'CASA 6', status: 'OCUPADA'),
    Casa(id: '11117', nome: 'CASA 7', status: 'SEM MORADOR'),
    Casa(id: '11118', nome: 'CASA 8', status: 'SEM MORADOR'),
    Casa(id: '11119', nome: 'CASA 9', status: 'SEM MORADOR'),
  ];

  List<Casa> getCasasByCondominioId(String condominioId) {
    return _casas;
   /* var snapshot = await Firestore.instance
        .collection('condominios')
        .document(condominioId)
        .collection('casas')
        .getDocuments();

    final documents = snapshot.documents;

    var list = List.generate(
        documents.length, (i) => Casa.fromJson(documents[i].data));
    return list;*/
  }
}
