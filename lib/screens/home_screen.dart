import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Condominio Doce Lar', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}