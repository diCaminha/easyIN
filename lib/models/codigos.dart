import 'package:flutter/material.dart';

class Codigo {
  String uuid;
  String casa;


  Codigo(
      {@required this.uuid,
      @required this.casa});

  Codigo.fromJson(Map<String, dynamic> data) {
      uuid = data['uuid'];
      casa = data['casa'];
    
  }
}
