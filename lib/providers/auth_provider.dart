import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyin/models/usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> signup(String nome, String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCtt2J3E02-jf03Iik3WxpJNW-fvI_Hhv0';
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));

      final responseData = json.decode(response.body);
      final usuario = Usuario(
          id: responseData['localId'],
          nome: nome,
          email: responseData['email']);
      _userId = responseData['localId'];
  
      await Firestore.instance
          .collection('usuarios')
          .document(_userId)
          .setData(usuario.toMap());

      notifyListeners();

    } catch (e) {
      throw e;
    }
  }

  Future<void> signin(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCtt2J3E02-jf03Iik3WxpJNW-fvI_Hhv0';
    
    try {
      final response = await http.post(url,
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true}));
    final responseData = json.decode(response.body);
    _token = responseData['idToken'];
    _userId = responseData['localId'];


    notifyListeners();
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  String get userId {
    return _userId;
  }

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }
}
