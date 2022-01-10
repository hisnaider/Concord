import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/models/myuser.dart';

class Solicitacoes{
  Solicitacoes();
  
  final CollectionReference usuariosCollection = FirebaseFirestore.instance.collection("Usuarios");
  final Stream<UserData> usera = DatabaseService(uid: uid!).userData;
  

  Future enviarSolic(String id) async {
    return await usuariosCollection.doc(id).collection("Amigos").doc(uid).set({
      "id": uid,
      "amigos": false,
      "nome": nome_user,
      "foto": foto_user,
      }
    );
  }
  Future aceitarsolic(String id) async {
    DateTime dia = DateTime.now();
    return await usuariosCollection.doc(id).collection("Amigos").doc(uid).set({
      "id": uid,
      "amigos": true,
      "nome": nome_user,
      "foto": foto_user,
      "amigosdesde": DateTime(dia.year,dia.month,dia.day),
      "apelido": nome_user
      }
    );
  }
} 