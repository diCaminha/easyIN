import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyin/models/casa.dart';
import 'package:flutter/material.dart';

class CasasProvider with ChangeNotifier {
  CasasProvider({this.userId});

  final String userId;
  String condominioId;

  Future<List<Casa>> getCasasByCondominioId() async {
   getCondominioId();

   var query = Firestore.instance
        .collection('condominios')
        .document(condominioId)
        .collection('casas')
        .orderBy('nome');

    var querySnapshot = await query.getDocuments();

    return getCasas(querySnapshot);
  }

  List<Casa> getCasas(QuerySnapshot querySnapshot) {
    final activities = <Casa>[];

    final documents = querySnapshot.documents;
    for (var document in documents) {
        final casa = Casa.fromJson(document.data);
        activities.add(casa.copyWith(id: document.documentID));
    }
    return activities;
  }

  void getCondominioId() {
    var condominios = Firestore.instance.collection('condominions').limit(1).getDocuments();
    condominios.then((value) => {
      for (var document in value.documents) {
        condominioId = document.documentID
      }  
    });
  }
}
