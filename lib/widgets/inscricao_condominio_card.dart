import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyin/models/codigos.dart';
import 'package:easyin/screens/home_morador.dart';
import 'package:flutter/material.dart';

class InscricaoCondominioCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormInscricaoState();
}

class FormInscricaoState extends State {
  final _form = GlobalKey<FormState>();
  final databaseReference = Firestore.instance;
  String codigo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 8.0,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Entrar com código',
                    style: TextStyle(color: Colors.black54, fontSize: 18),
                  ),
                  Form(
                    key: _form,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Nome do Condomínio'),
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            codigo = value;
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
                              buscarCodigo(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Future<void> buscarCodigo(BuildContext context) async {
    _form.currentState.save();
    Codigo codigos;

    var querySnapshot = await Firestore.instance
        .collection('codigos')
        .where("uuid", isEqualTo: codigo)
        .getDocuments();

    final documents = querySnapshot.documents;
    print(documents);

    codigos = Codigo.fromJson(documents[0].data);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeMoradorScreen(
                  codigo: codigos,
                )));
  }
}
