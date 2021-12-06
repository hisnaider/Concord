import 'package:flutter/material.dart';

import 'Components/button.dart';
import 'Components/campodetexto.dart';


class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  child: CampoDeTextoEmail(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CampoDeTextoSenha(),
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

                Divider(
                  height: 2,
                  color: Colors.black
                ),
                ///Container(height: 2,width: 500,color: Colors.grey[800],),
                Padding(
                  padding: const EdgeInsets.all(20),
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