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
                          data: "Quinta Feita - 10/10/10",
                          casa: 'Casa 5',
                          nome: 'Wesley',
                          tipoEntrada: TipoEntrada.MOTO,
                          quantidadePessoa: 1,
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
                          nome: 'Rodrigo',
                          tipoEntrada: TipoEntrada.PESSOA,
                          quantidadePessoa: 2,
                        ),
                        VisitsCard(
                          data: "Quinta Feita - 10/10/10",
                          casa: 'Casa 1',
                          nome: 'Professor',
                          tipoEntrada: TipoEntrada.PESSOA,
                          quantidadePessoa: 1,
                        ),
                        VisitsCard(
                          data: "Quinta Feita - 10/10/10",
                          casa: 'Casa 10',
                          nome: 'Marum',
                          tipoEntrada: TipoEntrada.CARRO,
                          quantidadePessoa: 4,
                        ),
                        VisitsCard(
                          data: "Quinta Feita - 10/10/10",
                          casa: 'Casa 12',
                          nome: 'Wesley',
                          tipoEntrada: TipoEntrada.MOTO,
                          quantidadePessoa: 2,
                        ),
                        VisitsCard(
                          data: "Quinta Feita - 10/10/10",
                          casa: 'Casa 27',
                          nome: 'Santos',
                          tipoEntrada: TipoEntrada.CARRO,
                          quantidadePessoa: 5,
                        ),
                        VisitsCard(
                          data: "Quinta Feita - 10/10/10",
                          casa: 'Casa 21',
                          nome: 'Wesley',
                          tipoEntrada: TipoEntrada.MOTO,
                          quantidadePessoa: 2,
                        ),
                        VisitsCard(
                          data: "Quinta Feita - 10/10/10",
                          casa: 'Casa 15',
                          nome: 'Brito e Neiva',
                          tipoEntrada: TipoEntrada.PESSOA,
                          quantidadePessoa: 2,
                        ),
                        VisitsCard(
                          data: "Quinta Feita - 10/10/10",
                          casa: 'Casa 33',
                          nome: 'Augusto',
                          tipoEntrada: TipoEntrada.MOTO,
                          quantidadePessoa: 1,
                        ),
                        VisitsCard(
                          data: "Quinta Feita - 10/10/10",
                          casa: 'Casa 50',
                          nome: 'Henrique',
                          tipoEntrada: TipoEntrada.CARRO,
                          quantidadePessoa: 1,
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
