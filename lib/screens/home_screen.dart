import 'package:easyin/providers/casas_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    final casas = Provider.of<CasasProvider>(context)
        .getCasasByCondominioId("hjPdoOOYaf9cCufgiuV8");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Condominio Doce Lar',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: casas.length,
        itemBuilder: (ctx, i) => Container(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/casa');
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: ListTile(
                  title: Text(casas[i].nome),
                  subtitle: casas[i].status == 'OCUPADA'
                      ? Text(
                          casas[i].status,
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        )
                      : Text(
                          casas[i].status,
                          style: TextStyle(color: Colors.lightBlue, fontSize: 10),
                        ),
                ),
              ),
            ),
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
        ),
      ),
    );
  }
}
