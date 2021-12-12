import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Services/contatos.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference usuariosCollection = FirebaseFirestore.instance.collection("Usuarios");

  Future atualizarDadosUser(String nome, String birth, String foto) async {
    return await usuariosCollection.doc(uid).set({
      "nome": nome,
      "birth": birth,
      "foto": foto,
      }
    );
  }

  List<ContatosUser> _listaContatosUser(QuerySnapshot snapshot){
    return snapshot.docs.map((e) {
      return ContatosUser(
        foto: e.get("foto") ?? "",
        nome: e.get("nome") ?? "",
        birth: e.get("birth") ?? "");
    }).toList();
  }

  Stream<List<ContatosUser>> get contatos{
    return usuariosCollection.snapshots().map(_listaContatosUser);
  }
}