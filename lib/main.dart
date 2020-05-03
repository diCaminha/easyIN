import 'package:easyin/screens/auth_screen.dart';
import 'package:easyin/screens/concierge_screen/concierge_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyIn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.white
      ),
      home: ConciergePage(), 
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