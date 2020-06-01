import 'package:easyin/models/condominio.dart';
import 'package:easyin/screens/concierge_screen/concierge_page.dart';
import 'package:easyin/screens/home_screen.dart';

import 'package:easyin/widgets/form_condominio.dart';
import 'package:easyin/widgets/inscricao_condominio_card.dart';

import 'package:flutter/material.dart';

class HomeCondominioScreen extends StatefulWidget {
  static const String routeName = '/home-condominio';

  @override
  State<StatefulWidget> createState() => HomeState2();
}

class HomeState2 extends State {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    var stack = Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InscricaoCondominioCard(),
                FormCondominio(),
              ],
            ),
          ),
        )
      ],
    );

    final List<Widget> _children = [stack, ConciergePage(), HomeScreen()];
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: new Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: new Text("Porteiro")),
          BottomNavigationBarItem(
              icon: Icon(Icons.hotel), title: new Text("Casa"))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
