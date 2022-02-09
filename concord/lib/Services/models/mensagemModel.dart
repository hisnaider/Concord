import 'package:cloud_firestore/cloud_firestore.dart';

class MensagemModel{
  final Timestamp data;
  final String mensagem;
  final int reacao;
  final String id;
  final bool visto;
  MensagemModel({required this.mensagem, required this.data, required this.reacao, required this.id, required this.visto, });
}