import 'package:easyin/models/condominio.dart';

import 'package:easyin/widgets/form_condominio.dart';
import 'package:easyin/widgets/inscricao_condominio_card.dart';

import 'package:flutter/material.dart';

class HomeCondominioScreen extends StatelessWidget {

  static const String routeName = '/home-condominio';
  
  @override
  Widget build(BuildContext context) {
    
    final List<Condominio> condominiosUsuario = [
      Condominio(id: '11111', nomeSindico: 'Denis Caminha', nome: 'Condominio Doce Lar', endereco: 'Rua Evaristo Veiga 889', numCasas: 3),
    ];

    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InscricaoCondominioCard(deviceSize: deviceSize),
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
      ),
    );
  }
}
