import 'package:concord/Services/auth.dart';
import 'package:flutter/material.dart';

import 'Components/button.dart';
import 'Components/campodetexto.dart';


class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Autenticador _auth = Autenticador();
  String email="";
  String senha="";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(color: Colors.amber,)
              ],
            ),

          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    child: Text("Login", style: TextStyle(fontSize: 30),)),
                ),               
                Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 15),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.grey[700]),
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 17),
                        decoration: decemail,
                        onChanged: (valor){
                          setState(() => email = valor);
                        },
                      ),
                    ),
                  ),
                Padding(
                    padding: const EdgeInsets.only(top: 20,bottom: 15),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.grey[700]),
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 17),
                        decoration: decsenha,
                        onChanged: (valor){
                          setState(() => email = valor);
                        },
                      ),
                    ),
                  ),
                Container(
                  width:double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: Text("Esqueci minha senha")
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: LoginButton(),
                ),
                GestureDetector(
                  onTap: () async {
                    dynamic resultado = await _auth.sign();
                    if (resultado == null) print("erro");
                    else {
                      print("certo");
                      print(resultado.id);
                    }
                  },
                  child: Text("Click aqui pra logar de forma anonima"),
                ),

                Divider(
                  height: 20,
                  color: Colors.black
                ),
                ///Container(height: 2,width: 500,color: Colors.grey[800],),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Center(child: Text("Caso não tenha uma conta, crie uma, é de graça!!!",style: TextStyle(fontSize: 17),textAlign: TextAlign.center,)),
                ),
                RegistrarButton(),
          
              ],
            )
          )
        ],
      ),
    );
  }
}