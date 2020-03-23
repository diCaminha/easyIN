import 'package:easyin/models/condominio.dart';
import 'package:easyin/screens/home_page.dart';
import 'package:flutter/material.dart';

class HomeCondominioScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeCondominioScreenState();
}

class _HomeCondominioScreenState extends State {
  final _form = GlobalKey<FormState>();

  var _condominio = Condominio(
      id: null, nome: '', endereco: '', nomeSindico: '', numCasas: 0);

  void _saveForm() async {
    _form.currentState.save();
    // await databaseReference.collection("condominios").add({
    //   'nome': _condominio.nome,
    //   'endereco': _condominio.endereco,
    //   'nomeSindico': 'Denis',
    //   'numCasas': _condominio.numCasas
    // });
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 8.0,
                        child: Container(
                          height: 200,
                          width: deviceSize.width * 0.90,
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Fazer parte de um condomínio',
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 18),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'Insira o código do condomínio',
                                      border: OutlineInputBorder()),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'código vazio';
                                    }
                                  },
                                  onSaved: (value) {},
                                ),
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
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 8.0,
                        child: Container(
                            width: deviceSize.width * 0.90,
                            padding: EdgeInsets.all(16.0),
                            child: Form(
                              key: _form,
                              child: ListView(
                                children: <Widget>[
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Nome do Condomínio'),
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
                                    decoration:
                                        InputDecoration(labelText: 'Endereço'),
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
                                    decoration: InputDecoration(
                                        labelText: 'Nº de casas'),
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
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
