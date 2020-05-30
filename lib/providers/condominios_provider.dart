import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyin/models/condominio.dart';
import 'package:easyin/models/usuario.dart';
import 'package:flutter/material.dart';

class CondominiosProvider with ChangeNotifier {
  CondominiosProvider({this.userId});

  final String userId;
  List<Condominio> _condominios = [];

  Future<void> salvar(Condominio _condominio) async {
    final document =
        await Firestore.instance.collection('usuarios').document(userId).get();

    Usuario sindico = new Usuario(
        id: document.documentID, nome: document.data['nome'], email: null);

    var ref = await Firestore.instance.collection("condominios").add({
      'nome': _condominio.nome,
      'endereco': _condominio.endereco,
      'nomeSindico': sindico.nome,
      'idSindico': sindico.id,
      'numCasas': _condominio.numCasas
    });

    await Firestore.instance
        .collection('usuarios')
        .document(sindico.id)
        .collection('condominios')
        .add({
      'nome': _condominio.nome,
      'endereco': _condominio.endereco,
      'nomeSindico': sindico.nome,
    });

    for (int i = 1; i <= _condominio.numCasas; i++) {
       await Firestore.instance
        .collection('condominios')
        .document(ref.documentID)
        .collection('casas')
        .add({
            'nome': 'CASA $i',
            'status': 'CRIADA'
        });
    }

    fetchAndUpdate();
  }

  void fetchAndUpdate() async {
    var snapshot = await Firestore.instance
        .collection('usuarios')
        .document(userId)
        .collection('condominios')
        .getDocuments();

    final documents = snapshot.documents;

    _condominios = List.generate(
        documents.length, (i) => Condominio.fromJson(documents[i].data));
  }

  List<Condominio> get condominios {
    fetchAndUpdate();
    return _condominios;
  }
}
