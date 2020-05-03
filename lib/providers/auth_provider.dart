import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyin/models/usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  String _token;
  String _userId;

  Future<void> signup(String nome, String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCtt2J3E02-jf03Iik3WxpJNW-fvI_Hhv0';
    final response = await http.post(url,
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true}));
    
    final responseData = json.decode(response.body);

    final usuario = Usuario(nome:nome, email:responseData['email']);

    await Firestore.instance.collection('usuarios').add(usuario.toMap());
  }

  Future<void> signin(String email, String password) async {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
