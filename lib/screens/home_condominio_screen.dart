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
    final List<Condominio> condominiosUsuario = [
      Condominio(id: '', nomeSindico: '', nome: '', endereco: '', numCasas: 3),
    ];

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
                Text(
                  'Meus condomínios',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Flexible(
                  child: ListView.builder(
                      itemCount: condominiosUsuario.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          leading: Icon(Icons.home),
                          title: Text(
                            '${condominiosUsuario[index].nome}',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(condominiosUsuario[index].endereco),
                          onTap: () {
                            Navigator.of(context).pushNamed('/home');
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        )
      ],
    );

    final List<Widget> _children = [stack, ConciergePage(), HomeScreen()];
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: new Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), title: new Text("Porteiro")),
          BottomNavigationBarItem(icon: Icon(Icons.hotel), title: new Text("Casa"))
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
