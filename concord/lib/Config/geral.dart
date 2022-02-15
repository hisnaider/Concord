import 'package:flutter/material.dart';
String? uid;
String? fotoUser;
String? nomeUser;
Color corPrimaria = Colors.orange[300]!;
Color corTexto = Colors.white;
String semFoto = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png";

void infoUser(id, foto, nome){
  uid = id; 
  fotoUser = foto; 
  nomeUser = nome; 
}

void trocarCorPrimaria(cor){
  corPrimaria = cor;
  corTexto = corPrimaria.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}