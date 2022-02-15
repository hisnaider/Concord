import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/imagens.dart';
import 'package:concord/Services/models/myuser.dart';
import 'package:concord/Services/notifica%C3%A7%C3%B5es.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';


class Autenticador{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Notif _notif = Notif();

  Myuser? _usuariofirebase(User? usuario){
    return usuario != null ? Myuser(uid: usuario.uid) : null;
  }

  DatabaseImagens img = DatabaseImagens();


  ///Stream
  Stream<Myuser?> get user  {
    return _auth.authStateChanges().map((User? user) => _usuariofirebase(user));
    }



  Future logarusuario(/*String nome,*/ String email,/* String birth,*/ String senha) async {
    try {
      UserCredential resultado = await _auth.signInWithEmailAndPassword(email: email, password: senha);
      User? usuario = resultado.user;
      await _notif.salvarToken();
      return  _usuariofirebase(usuario);
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  Future registrarUsuario(String nome, String email, Timestamp birth, File? foto, String nickname, String frase, String senha,) async {
    try {
      UserCredential resultado = await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      User? usuario = resultado.user;

      FirebaseFirestore.instance.collection("EmailsCadastrados").doc(email).set({
        "banido": false,
        "id": usuario!.uid
      });


      String url;
      foto != null 
        ? url = await img.perfilImage(foto, "Usuarios/${usuario.uid}/perfil/foto_perfil")
        : url = await img.perfilImage(null, "Sistema/Sem_foto.png");

     
      await DatabaseService(uid: usuario.uid).atualizarDadosUser(nome, email, birth, url, nickname, frase);

      FirebaseFirestore.instance.collection("Usuarios").doc(usuario.uid).update({
        "solicitações": [],
        "bloqueados": [],
        "elogios": [],
        "mostrarAmigos": 0,
        "mostrarBirth": 0,
        "mostrarNomeReal": 0,
      });

      return  _usuariofirebase(usuario);
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }




  Future deslogar() async {
    try {
      return await _auth.signOut();
      } catch (e) {
    }
  }
}