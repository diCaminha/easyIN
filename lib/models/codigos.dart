import 'package:flutter/material.dart';

class Codigo {
  final String uuid;
  final String casa;


  Codigo(
      {@required this.uuid,
      @required this.casa});

  static fromJson(Map<String, dynamic> data) {
    return {
      'uuid': data['uuid'],
      'casa': data['casa']
    };
  }
}
