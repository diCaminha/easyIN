import 'package:easyin/widgets/form_condominio.dart';
import 'package:easyin/widgets/inscricao_condominio_card.dart';
import 'package:flutter/material.dart';

class HomeCondominioScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                  Flexible(
                    child: ListView.builder(
                        itemCount: 7,
                        itemBuilder: (ctx, index) {
                          return ListTile(
                            leading: Icon(Icons.home),
                            title: Text(
                              'Condominio Aparecida - casa: 43A',
                              style: TextStyle(color: Colors.white),
                            ),
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
