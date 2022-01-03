import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Config/geral.dart';

class Solicitacoes{
  Solicitacoes();
  
  final CollectionReference usuariosCollection = FirebaseFirestore.instance.collection("Usuarios");
  

  Future enviarSolicitacao(String id) async {
    return await usuariosCollection.doc(id).collection("Amigos").doc(uid).set({
      "id": uid,
      "amigos": false,
      }
    );
  }
}