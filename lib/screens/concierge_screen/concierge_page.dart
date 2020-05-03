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
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) => Column(
                      children: <Widget>[
                        VisitsCard(
                          data: "Quinta Feita - 10/10/10",
                          casa: 'Casa 5',
                          nome: 'Wesley',
                          tipoEntrada: TipoEntrada.MOTO,
                          quantidadePessoa: 3,
                        ),
                        VisitsCard(
                          data: "Quinta Feita - 10/10/10",
                          casa: 'Casa 2',
                          nome: 'Denis',
                          tipoEntrada: TipoEntrada.CARRO,
                          quantidadePessoa: 4,
                        ),
                         VisitsCard(
                          data: "Quinta Feita - 10/10/10",
                          casa: 'Casa 7',
                          nome: 'Rodboy',
                          tipoEntrada: TipoEntrada.PESSOA,
                          quantidadePessoa: 2,
                        )
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
