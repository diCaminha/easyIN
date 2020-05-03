import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/condominio.dart';
import '../screens/home_page.dart';

class FormCondominio extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => FormCondominioState();
}

class FormCondominioState extends State {
  final _form = GlobalKey<FormState>();
  final databaseReference = Firestore.instance;

  var _condominio = Condominio(
      id: null, nome: '', endereco: '', nomeSindico: '', numCasas: 0);

  void _saveForm() async {
    _form.currentState.save();
    await databaseReference.collection("condominios").add({
      'nome': _condominio.nome,
      'endereco': _condominio.endereco,
      'nomeSindico': 'Denis',
      'numCasas': _condominio.numCasas
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 8.0,
        child: Container(
            width: 600 * 0.90,
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Nome do Condomínio'),
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      _condominio = Condominio(
                          id: null,
                          nome: value,
                          endereco: _condominio.endereco,
                          nomeSindico: _condominio.nomeSindico,
                          numCasas: _condominio.numCasas);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Endereço'),
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      _condominio = Condominio(
                          id: null,
                          nome: _condominio.nome,
                          endereco: value,
                          nomeSindico: _condominio.nomeSindico,
                          numCasas: _condominio.numCasas);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nº de casas'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      _condominio = Condominio(
                          id: null,
                          nome: _condominio.nome,
                          endereco: _condominio.endereco,
                          nomeSindico: _condominio.nomeSindico,
                          numCasas: int.parse(value));
                    },
                  ),
                  Container(
                    width: 300.0,
                    child: RaisedButton(
                      color: Colors.deepOrangeAccent,
                      child: Text(
                        'Criar Condomínio',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _saveForm();
                      },
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
