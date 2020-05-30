import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyin/models/codigos.dart';
import 'package:easyin/screens/home_morador.dart';
import 'package:flutter/material.dart';

class InscricaoCondominioCard extends StatelessWidget {
  const InscricaoCondominioCard({
    Key key,
    @required this.deviceSize,
  }) : super(key: key);

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    String codigo;
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          margin: EdgeInsets.only(top: 50.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 8.0,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Fazer parte de um condomínio',
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Insira o código do condomínio',
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'código vazio';
                      }
                    },
                    onSaved: (value) {
                      buscarCodigo(value, context);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300.0,
                  child: RaisedButton(
                    color: Colors.deepOrangeAccent,
                    child: Text(
                      'Enviar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> buscarCodigo(String value, BuildContext context) async {
    Codigo codigos;

    var querySnapshot = await Firestore.instance
        .collection('codigos')
        .where("uuid", isEqualTo: value)
        .getDocuments();

    final documents = querySnapshot.documents;

    codigos = Codigo.fromJson(documents[1].data);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeMoradorScreen(
                  codigo: codigos,
                )));
  }
}
