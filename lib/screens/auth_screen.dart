import 'package:easyin/providers/auth_provider.dart';
import 'package:easyin/screens/home_condominio_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
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
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        'EasyIN',
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                    ),
                  ),
                  Flexible(
                    child: AuthCard(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;

  Map<String, String> _authData = {
    'email': '',
    'password': '',
    'nome': '',
  };
  bool _isLoading = false;

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      child: Container(
        height: _authMode == AuthMode.Signup ? 600 : 500,
        constraints: BoxConstraints(
          minHeight: _authMode == AuthMode.Signup ? 600 : 500,
        ),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'E-mail', border: OutlineInputBorder()),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'email inválido';
                      }
                    },
                    onSaved: (value) {
                      _authData['email'] = value;
                    },
                  ),
                ),
                if (_authMode == AuthMode.Signup)
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Nome', border: OutlineInputBorder()),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'nome é obrigatório.';
                        }
                      },
                      onSaved: (value) {
                        _authData['nome'] = value;
                      },
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Senha', border: OutlineInputBorder()),
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return 'Senha precisa ser maior do que 5 caracteres';
                      }
                    },
                    onSaved: (value) {
                      _authData['password'] = value;
                    },
                  ),
                ),
                if (_authMode == AuthMode.Signup)
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: TextFormField(
                      enabled: _authMode == AuthMode.Signup,
                      decoration: InputDecoration(
                          labelText: 'Confirmar senha',
                          border: OutlineInputBorder()),
                      obscureText: true,
                      validator: _authMode == AuthMode.Signup
                          ? (value) {
                              if (value != _passwordController.text) {
                                return 'Confirmação de senha está diferente da senha informada';
                              }
                            }
                          : null,
                    ),
                  ),
                SizedBox(
                  height: 50,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  SizedBox(
                    width: 300.0,
                    child: RaisedButton(
                      color: Colors.orange,
                      child: Text(
                        _authMode == AuthMode.Login ? 'ENTRAR' : 'CADASTRAR',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: _submitForm,
                    ),
                  ),
                FlatButton(
                  child: Text(
                    'Ir para ${_authMode == AuthMode.Login ? 'Tela de Cadastro' : 'Login'}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  onPressed: _switchAuthMode,
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    final formState = _formKey.currentState.validate();

    if (!formState) {
      return;
    }

    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });

    if (_authMode == AuthMode.Login) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider
          .signin(_authData['email'], _authData['password'])
          .then((user) => {
                print('@@@@@@ test @@@@@@'),
                Navigator.of(context).pushReplacementNamed('/home-condominio'),
              })
          .catchError((e) => AlertDialog(
              title: Text('Erro ao fazer login'), backgroundColor: Colors.red));
    } else {
      final authProvider = Provider.of<AuthProvider>(context);
      authProvider
          .signup(_authData['nome'], _authData['email'], _authData['password'])
          .then((user) => {
                _switchAuthMode(),
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AuthScreen())),
              })
          .catchError((e) => AlertDialog(
              title: Text('Erro ao fazer login'), backgroundColor: Colors.red));
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }
}
