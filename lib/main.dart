import 'package:easyin/providers/auth_provider.dart';
import 'package:easyin/providers/casas_provider.dart';
import 'package:easyin/providers/condominios_provider.dart';
import 'package:easyin/screens/auth_screen.dart';
import 'package:easyin/screens/casa_screen.dart';
import 'package:easyin/screens/home_condominio_screen.dart';
import 'package:easyin/screens/home_screen.dart';
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
          ChangeNotifierProxyProvider<AuthProvider, CondominiosProvider>(
            update: (ctx, auth, _) => CondominiosProvider(userId:auth.userId),
          ),
          ChangeNotifierProxyProvider<AuthProvider, CasasProvider>(
            update: (ctx, auth, _) => CasasProvider(userId:auth.userId),
          )
        ],
        child: Consumer<AuthProvider>(
          builder: (ctx, auth, _) => MaterialApp(
            title: 'Condo App',
            theme: ThemeData(
                primarySwatch: Colors.orange, accentColor: Colors.white),
            home: auth.isAuth ? HomeCondominioScreen() : AuthScreen(),
            routes: {
              HomeCondominioScreen.routeName: (ctx) => HomeCondominioScreen(),
              HomeScreen.routeName: (ctx) => HomeScreen(),
              CasaScreen.routeName: (ctx) => CasaScreen(),
            },
          ),
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
