import 'package:flutter/material.dart';
String? uid;
String? foto_user;
String? nome_user;
Color cor_primaria = Colors.orange[300]!;
Color cor_texto = Colors.white;
String sem_foto = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png";

void infoUser(id, foto, nome){
  uid = id; 
  foto_user = foto; 
  nome_user = nome; 
}

void trocar_cor_primaria(cor){
  cor_primaria = cor;
  cor_texto = cor_primaria.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}