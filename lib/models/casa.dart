import 'package:flutter/material.dart';

class Casa {
   String id;
   String nome;
   String status;


  Casa(
      {@required this.id,
      @required this.nome,
      @required this.status});

  Casa.fromJson(String id, Map<String, dynamic> data) {
      id = id;
      nome = data['nome'];
      status = data['status'];
  }

  Casa copyWith({
    String id,
    String nome,
    String status
  }) {
    return Casa(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      status: status ?? this.status
    );
  }
}
