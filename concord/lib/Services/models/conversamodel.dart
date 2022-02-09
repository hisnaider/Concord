import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ConversaModel{
  final String id;
  final String ultimaMensagem;
  final String quemMandou;

  ConversaModel({required this.id,required this.ultimaMensagem, required this.quemMandou});
}