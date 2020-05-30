import 'package:easyin/models/codigos.dart';
import 'package:flutter/material.dart';

import 'form_visita.dart';

class HomeMoradorScreen extends StatefulWidget {
  const HomeMoradorScreen({Key key, @required this.codigo}) : super(key: key);
  final Codigo codigo;

  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeMoradorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem vindo a ${widget.codigo.casa}'),
      ),
      body: Container(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VisitaScreen(casa: widget.codigo.casa)));
          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ListTile(
                title: Text("Criar visita"),
                subtitle: Text(
                  "Cire uma visita",
                  style: TextStyle(color: Colors.lightBlue, fontSize: 10),
                ),
              ),
            ),
          ),
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
    );
  }
}
