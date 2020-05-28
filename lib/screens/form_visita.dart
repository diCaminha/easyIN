import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyin/models/enum/tipo_entrada.dart';
import 'package:easyin/models/visita.dart';
import 'package:flutter/material.dart';

import 'home_condominio_screen.dart';

class VisitaScreen extends StatefulWidget {
  @override
  _VisitaState createState() => _VisitaState();
}

class _VisitaState extends State<VisitaScreen> {
  final _form = GlobalKey<FormState>();
  var _data;
  var _pessoaOuPlaca;
  TipoEntrada _tipoEntrada;
  var _quantidadePessoa;

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
                  'Cadastro de Visitas',
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
                  Form(
                    key: _form,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Data da Visita'),
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            _data = value;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Nome ou Placa'),
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            _pessoaOuPlaca = value;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Nº visitas'),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            _quantidadePessoa = value;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Modo de Entrada'),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            _tipoEntrada = getTipoEntrada(value);
                          },
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: 300.0,
                          child: RaisedButton(
                            color: Colors.deepOrangeAccent,
                            child: Text(
                              'Criar Visita',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              _saveForm();
                              setState(() {
                                MaterialPageRoute(builder: (context) => HomeCondominioScreen());  
                              });
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

  void _saveForm() async {
    _form.currentState.save();
    Visita _visita = Visita(data: _data, pessoaOuPlaca: _pessoaOuPlaca, quantidadeDePessoas: _quantidadePessoa, tipoEntrada: _tipoEntrada);

    await Firestore.instance.collection("visitas").add({
      'data': _visita.data,
      'pessoaOuPlaca': _visita.pessoaOuPlaca,
      'quantidadeDePessoas': _visita.quantidadeDePessoas,
      'tipoEntrada': _visita.tipoEntrada.index
    });
  }

  TipoEntrada getTipoEntrada(String value) {
    if (value == "0") {
      return TipoEntrada.CARRO;
    } else if (value == "1") {
      return TipoEntrada.MOTO;
    } else {
      return TipoEntrada.PESSOA;
    }
  }
}