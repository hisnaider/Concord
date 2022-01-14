import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class AmigosUser{
  final Timestamp amigosDesde;
  final String apelido;
  final String id;
  final bool melhoresAmigos;
  final String relacao;

  AmigosUser({required this.amigosDesde, required this.apelido, required this.id, required this.melhoresAmigos , required this.relacao});
}