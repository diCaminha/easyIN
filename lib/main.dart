import 'package:easyin/providers/auth_provider.dart';
import 'package:easyin/screens/auth_screen.dart';
import 'package:easyin/screens/home_condominio_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_condominio_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: AuthProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Condo App',
          theme: ThemeData(
              primarySwatch: Colors.orange, accentColor: Colors.white),
          home: AuthScreen(),
          routes: {},
        ));
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
