import 'package:flutter/material.dart';
String? uid;
Color cor_primaria = Colors.amber;
Color cor_texto = Colors.white;

void nomeUser(id){
  uid = id; 
}

void trocar_cor_primaria(cor){
  cor_primaria = cor;
  cor_texto = cor_primaria.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}