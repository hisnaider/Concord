import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/models/myuser.dart';

class Solicitacoes{
  Solicitacoes();
  
  final CollectionReference usuariosCollection = FirebaseFirestore.instance.collection("Usuarios");
  

  Future enviarSolic(String id) async {
    return await usuariosCollection.doc(id).update({
      "solicitações": FieldValue.arrayUnion([uid])
      }
    );
  }

  Future rejeitarsolic(String id) async {
    return await usuariosCollection.doc(uid).update({
      "solicitações": FieldValue.arrayRemove([id])
      }
    );
  }

  Future aceitarsolic(String id) async {
    return await usuariosCollection.doc(id).get().then((e) async {
      await usuariosCollection.doc(id).update({
        "solicitações": FieldValue.arrayRemove([uid])
        }
      );
      await usuariosCollection.doc(uid).update({
        "solicitações": FieldValue.arrayRemove([id])
        }
      );
      await usuariosCollection.doc(id).collection("Amigos").doc(uid).set({
        "id": uid,
        "apelido": nome_user,
        "melhores-amigos": false,
        "relação": "Amigos",
        "amigos-desde": DateTime.now()
        }
      );
      await usuariosCollection.doc(uid).collection("Amigos").doc(id).set({
        "id": e.id,
        "apelido": e.get("nome"),
        "melhores-amigos": false,
        "relação": "Amigos",
        "amigos-desde": DateTime.now()
        }
      );
    });
  }
} 