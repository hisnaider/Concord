import 'package:concord/Services/myuser.dart';
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


  Future RegistrarUsuario(String nome, String email, String birth, String senha) async {
    try {
      UserCredential resultado = await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      User? usuario = resultado.user;
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