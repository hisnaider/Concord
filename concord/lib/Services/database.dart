import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Services/models/addamigo.dart';
import 'package:concord/Services/models/amigos.dart';
import 'package:concord/Services/models/contatos.dart';
import 'package:concord/Services/models/myuser.dart';

import 'models/solicamigo.dart';

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
        birth: e.get("birth") ?? "",
        id: e.id,
        );
    }).toList();
  }

  UserData _userDataSnapshot(DocumentSnapshot snapshot){
    return UserData(
      id: uid,
      nome: snapshot["nome"],
      birth: snapshot["birth"],
      foto: snapshot["foto"]
      
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

  List<SolicUser> _listaSolicUser(QuerySnapshot snapshot){
    return snapshot.docs.map((e) {
      return SolicUser(
        foto: e.get("foto") ?? "",
        nome: e.get("nome") ?? "",
        id: e.id
        );
    }).toList();
  }

  List<AmigosUser> _amigos(QuerySnapshot snapshot){
    return snapshot.docs.map((e) {
      return AmigosUser(
        foto: e.get("foto") ?? "",
        nome: e.get("nome") ?? "",
        id: e.id,
        amigosdesde: e.get("amigosdesde") ?? DateTime.now(),
        apelido: e.get("apelido") ?? "",
        );
    }).toList();
  }



  Stream<List<ContatosUser>> get contatos{
    return usuariosCollection.snapshots().map(_listaContatosUser);
  }

  Stream<List<AmigosUser>> get amigos{
    return usuariosCollection.doc(uid).collection("Amigos").where("amigos", isEqualTo: true).snapshots().map(_amigos);
  }

  Stream<UserData> get userData{
    return usuariosCollection.doc(uid).snapshots().map(_userDataSnapshot);
  }
  Stream<List<AddUser>> addUser(String nome){
    return usuariosCollection.where("nome", isGreaterThanOrEqualTo: nome).where("nome", isLessThanOrEqualTo: nome+"z").snapshots().map(_listaAddUser);
  }
  Stream<List<SolicUser>> solicUser(){
    return usuariosCollection.doc(uid).collection("Amigos").where("amigos", isEqualTo: false).snapshots().map(_listaSolicUser);
  }

}