import 'package:easyin/screens/home_condominio_screen.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Condo App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.white
      ),
      home: HomeCondominioScreen(), 
      routes: {
        
      },
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello home"),
    );
  }
}