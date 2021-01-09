import 'dart:ffi';
import 'package:flutter/material.dart';
class Contato{
  int id;
  String nome;
  double HT;
  double LE;
  double VL;


  Contato(this.id, this.nome, this.HT, this.LE, this.VL);

  Map<String,dynamic> toMap () {

    var map = <String,dynamic> {
      'id': id,
      'nome': nome,
      'HT': HT,
      'LE': LE,
      'VL': VL
    };
    return map;
  }

  Contato.fromMap(Map<String,dynamic> map){
    id = map['id'];
    nome = map['nome'];
    HT = map['HT'];
    LE = map['LE'];
    VL = map['VL'];
  }
}