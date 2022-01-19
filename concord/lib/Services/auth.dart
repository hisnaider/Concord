import 'package:concord/Services/database.dart';
import 'package:concord/Services/imagens.dart';
import 'package:concord/Services/models/myuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';


class Autenticador{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Myuser? _usuariofirebase(User? usuario){
    return usuario != null ? Myuser(id: usuario.uid) : null;
  }

  DatabaseImagens img = DatabaseImagens();


  ///Stream
  Stream<Myuser?> get user  {
    return _auth.authStateChanges().map((User? user) => _usuariofirebase(user));
    }

  ///Logar como anonimo
  Future sign() async{
    try {
      UserCredential resultado = await _auth.signInAnonymously();
      User? usuario = resultado.user;
      return _usuariofirebase(usuario);
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  Future logarusuario(/*String nome,*/ String email,/* String birth,*/ String senha) async {
    try {
      UserCredential resultado = await _auth.signInWithEmailAndPassword(email: email, password: senha);
      User? usuario = resultado.user;
      return  _usuariofirebase(usuario);
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  Future registrarUsuario(String nome, String email, DateTime birth, File? foto, String nickname, String frase, String senha,) async {
    try {
      UserCredential resultado = await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      User? usuario = resultado.user;

      String url;
      foto != null 
        ? url = await img.perfilImage(foto, "Usuarios/${usuario!.uid}/perfil/foto_perfil")
        : url = await img.perfilImage(null, "Sistema/Sem_foto.npg");

     
        

      await DatabaseService(uid: usuario!.uid).atualizarDadosUser(nome, email, birth, url, nickname, frase);


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