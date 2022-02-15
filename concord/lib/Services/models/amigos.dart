import 'package:cloud_firestore/cloud_firestore.dart';

class AmigosUser{
  int id = 0;
  final Timestamp amigosDesde;
  final String apelido;
  final String uid;
  final bool melhoresAmigos;
  final String relacao;

  AmigosUser({required this.amigosDesde, required this.apelido, required this.uid, required this.melhoresAmigos , required this.relacao});
}