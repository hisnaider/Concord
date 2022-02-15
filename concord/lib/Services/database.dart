import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Services/models/amigos.dart';
import 'package:concord/Services/models/contatos.dart';
import 'package:concord/Services/models/conversamodel.dart';
import 'package:concord/Services/models/mensagemModel.dart';
import 'package:concord/Services/models/myuser.dart';

import 'models/solicuser.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});


  final CollectionReference usuariosCollection = FirebaseFirestore.instance.collection("Usuarios");

  Future atualizarDadosUser(String nome, String email, Timestamp birth, String foto, String nickname, String frase) async {
    return await usuariosCollection.doc(uid).set({
      "nome": nome,
      "email": email,
      "birth": birth,
      "foto": foto,
      "nickname": nickname,
      "frase": frase,
      }
    );
  }

  

  List<ContatoUser> _listaContatosUser(QuerySnapshot snapshot){
    return snapshot.docs.map((e) {
      return ContatoUser(
        foto: e.get("foto") ?? "",
        nickname: e.get("nickname") ?? "",
        birth: e.get("birth") ?? "",
        id: e.id,
        frase: e.get("frase"),
        elogios: e.get("elogios"),
        nome: e.get("nome"),
        mostrarAmigos: e.get("mostrarAmigos"),
        mostrarBirth: e.get("mostrarBirth"),
        mostrarNomeReal: e.get("mostrarNomeReal"),
        );
    }).toList();
  }

  UserData _userDataSnapshot(DocumentSnapshot snapshot){
    return UserData(
      id: snapshot.id,
      nickname: snapshot["nickname"] ?? "",
      nome: snapshot["nome"] ?? "",
      email: snapshot["email"] ?? "",
      birth: snapshot["birth"] ?? "",
      foto: snapshot["foto"] ?? "",
      frase: snapshot["frase"] ?? "",
      elogios: snapshot["elogios"] ?? "",
      mostrarAmigos: snapshot["mostrarAmigos"] ?? 0,
      mostrarBirth: snapshot["mostrarBirth"] ?? 0,
      mostrarNomeReal: snapshot["mostrarNomeReal"] ?? 0,
      
    );
  }




  SolicUser _listaSolicUser(DocumentSnapshot snapshot){
    return SolicUser(
      solic: snapshot["solicitações"]
    );
  }
  bool _listaAmigos(DocumentSnapshot snapshot){
    return snapshot.exists;
  }

  List<AmigosUser> _amigos(QuerySnapshot snapshot){
    return snapshot.docs.map((e) {
      return AmigosUser(
        amigosDesde: e.get("amigos-desde"),
        apelido: e.get("apelido"),
        uid: e.get("id"),
        melhoresAmigos: e.get("melhores-amigos"),
        relacao: e.get("relação")
        );
    }).toList();
  }

  UserData _otherUserDataSnapshot(DocumentSnapshot snapshot){
    return UserData(
      id: snapshot.id,
      nickname: snapshot["nickname"],
      nome: snapshot["nome"],
      email: snapshot["email"],
      birth: snapshot["birth"],
      foto: snapshot["foto"],
      frase: snapshot["frase"],
      elogios: snapshot["elogios"] ?? "",
      mostrarAmigos: snapshot["mostrarAmigos"] ?? 0,
      mostrarBirth: snapshot["mostrarBirth"] ?? 0,
      mostrarNomeReal: snapshot["mostrarNomeReal"] ?? 0,
    );
  }


  List<MensagemModel> _mensagens(QuerySnapshot snapshot){
    return snapshot.docs.map((e) {
      return MensagemModel(
        data: e.get("data"),
        mensagem: e.get("mensagem"),
        reacao: e.get("reacao"),
        id: e.get("id"),
        visto: e.get("visto")
        );
    }).toList();
    
  }

  List<ConversaModel> _conversas(QuerySnapshot snapshot){
    return snapshot.docs.map((e) {
      return ConversaModel(
        ultimaMensagem: e.get("ultimaMensagem"),
        id: e.id,
        quemMandou: e.get("quemMandou")
        
        );
    }).toList();
    
  }


  Stream<List<ContatoUser>> get contatos{
    return usuariosCollection.snapshots().map(_listaContatosUser);
  }

  Stream<List<AmigosUser>> amigos(){
    return usuariosCollection.doc(uid).collection("Amigos").snapshots().map(_amigos);
  }

  Stream<UserData> get userData{
    return usuariosCollection.doc(uid).snapshots().map(_userDataSnapshot);
  }
  Stream<List<ContatoUser>> addUser(String nome){
    return usuariosCollection.where("nickname", isGreaterThanOrEqualTo: nome).where("nickname", isLessThanOrEqualTo: nome+"z").snapshots().map(_listaContatosUser);
  }
  Stream<SolicUser> solicUser(){
    return usuariosCollection.doc(uid).snapshots().map(_listaSolicUser);
  }
  Stream<bool> listaamigos(String id){
    return usuariosCollection.doc(uid).collection("Amigos").doc(id).snapshots().map(_listaAmigos);
  }

  Stream<UserData> otherUserData (String id){
    return usuariosCollection.doc(id).snapshots().map(_otherUserDataSnapshot);
  }

  Stream<List<MensagemModel>> mensagens(String id){
    return usuariosCollection.doc(uid).collection("Conversas").doc(id).collection("Mensagens").snapshots().map(_mensagens);
  }

  Stream<List<ConversaModel>> get conversas{
    return usuariosCollection.doc(uid).collection("Conversas").snapshots().map(_conversas);
  }
}