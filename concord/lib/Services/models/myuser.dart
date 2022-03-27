import 'package:cloud_firestore/cloud_firestore.dart';


class Myuser{
  final String uid;
  String? nome;
  String? email;
  Timestamp? birth;
  String? foto;
  String? frase;
  List<dynamic>? elogios;
  int? mostrarAmigos;
  int? mostrarBirth;
  int? mostrarNomeReal;
  Myuser({required this.uid});
}

class UserData{
  final String id;
  final String nickname;
  final String nome;
  final String email;
  final Timestamp birth;
  final String foto;
  final String frase;
  final List<dynamic> elogios;
  final int mostrarAmigos;
  final int mostrarBirth;
  final int mostrarNomeReal;
  UserData({required this.id, required this.nickname, required this.nome, required this.email, required this.birth, required this.foto, required this.frase, required this.elogios, required this.mostrarAmigos, required this.mostrarBirth, required this.mostrarNomeReal});
}