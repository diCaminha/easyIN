import 'package:easyin/models/codigos.dart';
import 'package:flutter/material.dart';

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

          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ListTile(
                title: Text("Criar Visita"),
                subtitle: Text(
                  "Teste",
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
