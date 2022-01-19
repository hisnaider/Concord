
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Aplicativo/Pages/Home/listaAmigos/listaAmigos.dart';
import 'package:concord/Services/models/addamigo.dart';
import 'package:concord/Services/models/amigos.dart';
import 'package:concord/Services/models/contatos.dart';
import 'package:concord/Services/models/listaamigos.dart';
import 'package:concord/Services/models/myuser.dart';

import 'models/solicuser.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});


  final CollectionReference usuariosCollection = FirebaseFirestore.instance.collection("Usuarios");

  Future atualizarDadosUser(String nome, String email, DateTime birth, String foto, String nickname, String frase) async {
    return await usuariosCollection.doc(uid).set({
      "nome": nome,
      "email": email,
      "birth": birth,
      "foto": foto,
      "nickname": nickname,
      "frase": frase
      }
    );
  }

  

  List<ContatoUser> _listaContatosUser(QuerySnapshot snapshot){
    return snapshot.docs.map((e) {
      return ContatoUser(
        foto: e.get("foto") ?? "",
        nome: e.get("nome") ?? "",
        birth: e.get("birth") ?? "",
        id: e.id,
        frase: e.get("frase")
        );
    }).toList();
  }

  UserData _userDataSnapshot(DocumentSnapshot snapshot){
    return UserData(
      id: snapshot.id,
      nickname: snapshot["nickname"] ?? "",
      nome: snapshot["nome"],
      email: snapshot["email"] ?? "",
      birth: snapshot["birth"] ?? "",
      foto: snapshot["foto"],
      frase: snapshot["frase"]
      
    );
  }


  List<AddUser> _listaAddUser(QuerySnapshot snapshot){
    return snapshot.docs.map((e) {
      return AddUser(
        foto: e.get("foto") ?? "",
        nome: e.get("nome") ?? "",
        id: e.id
        );
    }).toList();
  }

  SolicUser _listaSolicUser(DocumentSnapshot snapshot){
    return SolicUser(
      solic: snapshot["Solicitações"]
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
        id: e.get("id"),
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
      frase: snapshot["frase"]
      
    );
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
    return usuariosCollection.where("nome", isGreaterThanOrEqualTo: nome).where("nome", isLessThanOrEqualTo: nome+"z").snapshots().map(_listaContatosUser);
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

}