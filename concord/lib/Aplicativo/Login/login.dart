import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Text("S"),

          ),
          Expanded(
            child: Column(
              children: [
                Text("Login:"),
                Container(padding: EdgeInsets.all(10),height: 25,width: 100,color: Colors.white,),
                Container(padding: EdgeInsets.all(10),height: 25,width: 100,color: Colors.white,),
                Container(padding: EdgeInsets.all(20),height: 25,width: 100, color: Colors.white, child: Center(child: Text("Entrar"),),),
                Container(padding: EdgeInsets.all(10),height: 2,width: 500),
                Container(padding: EdgeInsets.all(20),height: 25,width: 100, color: Colors.white, child: Center(child: Text("Registrar"),),),
              ],
            )
          )
        ],
      ),
    );
  }
}