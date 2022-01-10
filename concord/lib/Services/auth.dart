import 'package:concord/Services/database.dart';
import 'package:concord/Services/models/myuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Autenticador{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Myuser? _usuariofirebase(User? usuario){
    return usuario != null ? Myuser(id: usuario.uid) : null;
  }

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


  Future registrarUsuario(String nome, String email, String birth, String senha) async {
    try {
      UserCredential resultado = await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      User? usuario = resultado.user;

      await DatabaseService(uid: usuario!.uid).atualizarDadosUser(nome, birth, "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png");

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