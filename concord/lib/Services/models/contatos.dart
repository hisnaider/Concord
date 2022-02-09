import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ContatoUser{
  final String id;
  final String nickname;
  final Timestamp birth;
  final String foto;
  final String frase;
  final List<dynamic> elogios;
  final String nome;
  final int mostrarAmigos;
  final int mostrarBirth;
  final int mostrarNomeReal;
  ContatoUser({required this.id, required this.nickname, required this.birth, required this.foto, required this.frase, required this.elogios, required this.nome, required this.mostrarAmigos, required this.mostrarBirth, required this.mostrarNomeReal});
}