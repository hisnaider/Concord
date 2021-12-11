import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference usuariosCollection = FirebaseFirestore.instance.collection("Usuarios");

  Future atualizarDadosUser(String nome, String birth, String foto) async {
    return await usuariosCollection.doc(uid).set({
      "nome": nome,
      "birth": birth,
      "fofo": foto,
      }
    );
  }
}