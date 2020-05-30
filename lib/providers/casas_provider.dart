import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyin/models/casa.dart';
import 'package:flutter/material.dart';

class CasasProvider with ChangeNotifier {
  CasasProvider({this.userId});

  final String userId;
  String condominioId;

  Future<List<Casa>> getCasasByCondominioId() async {
   await getCondominioId();
   print(">>>>>>>> ${condominioId}");
   var query = Firestore.instance
        .collection('condominios')
        .document(condominioId)
        .collection('casas')
        .orderBy('nome');

    var querySnapshot = await query.getDocuments();

    return getCasas(querySnapshot);
  }

  List<Casa> getCasas(QuerySnapshot querySnapshot) {
    final casas = <Casa>[];

    final documents = querySnapshot.documents;
    for (var document in documents) {
        final casa = Casa.fromJson(document.documentID, document.data);
        casas.add(casa);
    }
    return casas;
  }

  Future<void> getCondominioId() async {
    var condominios = await Firestore.instance.collection('condominios').orderBy('numCasas').limit(1).getDocuments();

    for (var document in condominios.documents) {
       condominioId = document.documentID;
       break;
    }
  }
}
