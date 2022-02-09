import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/models/myuser.dart';

class Mensagens{
  Mensagens();
  
  final CollectionReference usuariosCollection = FirebaseFirestore.instance.collection("Usuarios");
  Future enviarMensagem(String id, String mensagem) async {
    Timestamp data = Timestamp.now();

    await usuariosCollection.doc(id).collection("Conversas").doc(uid).set({
      "ultimaMensagem": mensagem,
      "quemMandou": uid
      }
    );

    await usuariosCollection.doc(uid).collection("Conversas").doc(id).set({
      "ultimaMensagem": mensagem,
      "quemMandou": uid
      }
    );
    
    await usuariosCollection.doc(id).collection("Conversas").doc(uid).collection("Mensagens").doc(data.toString()).set({
      "data": data,
      "mensagem": mensagem,
      "reacao": 0,
      "id": uid,
      "visto": false
      }
    );
    return await usuariosCollection.doc(uid).collection("Conversas").doc(id).collection("Mensagens").doc(data.toString()).set({
      "data": data,
      "mensagem": mensagem,
      "reacao": 0,
      "id": uid,
      "visto": false
      }
    );
  }

  Future verMensagem(String id,String idMensagem) async {
    return await usuariosCollection.doc(id).collection("Conversas").doc(uid).collection("Mensagens").doc(idMensagem).update({
      "visto": true
      }
    );
  }
}