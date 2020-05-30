import 'package:easyin/models/enum/tipo_entrada.dart';
import 'package:easyin/screens/concierge_screen/visits_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConciergePage extends StatefulWidget {
  @override
  _ConciergePageState createState() => _ConciergePageState();
}

class _ConciergePageState extends State<ConciergePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Porteiro"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) => Column(
                      children: <Widget>[
                        VisitsCard(
                          data: "20/03/20",
                          casa: 'Casa 5',
                          nome: 'Wesley',
                          tipoEntrada: TipoEntrada.MOTO,
                          quantidadePessoa: 1,
                        ),
                        VisitsCard(
                          data: "20/03/20",
                          casa: 'Casa 5',
                          nome: 'WLY 2233',
                          tipoEntrada: TipoEntrada.CARRO,
                          quantidadePessoa: 4,
                        ),
                      ],
                    ),
                itemCount: 1),
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
}
