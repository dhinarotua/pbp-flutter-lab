import 'package:flutter/material.dart';

class Model {
  String judul;
  int nominal;
  String jenis;
  static List<Model> lst = [];

  Model({required this.judul, required this.nominal, required this.jenis});

  static void add({
    required judul,
    required nominal,
    required jenis,
  }) {
    lst.add(Model(judul: judul, nominal: nominal, jenis: jenis));
  }
}