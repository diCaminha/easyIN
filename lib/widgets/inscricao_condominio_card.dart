import 'package:flutter/material.dart';

class InscricaoCondominioCard extends StatelessWidget {
  const InscricaoCondominioCard({
    Key key,
    @required this.deviceSize,
  }) : super(key: key);

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 8.0,
        child: Container(
          height: 200,
          width: deviceSize.width * 0.90,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                'Fazer parte de um condomínio',
                style: TextStyle(color: Colors.black38, fontSize: 18),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Insira o código do condomínio',
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'código vazio';
                    }
                  },
                  onSaved: (value) {},
                ),
              ),
              Container(
                width: 300.0,
                child: RaisedButton(
                  color: Colors.deepOrangeAccent,
                  child: Text(
                    'Enviar',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}