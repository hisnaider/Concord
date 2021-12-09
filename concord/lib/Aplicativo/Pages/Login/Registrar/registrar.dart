import 'package:concord/Aplicativo/Pages/Login/Registrar/Components/button.dart';
import 'package:concord/Services/auth.dart';
import 'package:flutter/material.dart';

import 'Components/campodetexto.dart';


class Registrar extends StatefulWidget {
  const Registrar({ Key? key }) : super(key: key);

  @override
  _RegistrarState createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {

  final Autenticador _auth = Autenticador();
  String nome="";
  String email="";
  String nasc="";
  String senha="";
  String confirmsenha="";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(color: Colors.amber,)
              ],
            ),

          ),
          Expanded(
            flex: 4,
            child: Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: double.infinity,
                      child: Text("Registrar", style: TextStyle(fontSize: 30),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,bottom: 15),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.grey[700]),
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 17),
                        decoration: decuser,
                        onChanged: (valor){
                          setState(() => nome = valor);
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
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 17),
                        decoration: decbirth,
                        onChanged: (valor){
                          setState(() => nasc = valor);
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
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 17),
                        decoration: decsenha,
                        onChanged: (valor){
                          setState(() => senha = valor);
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
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 17),
                        decoration: decconfirmsenha,
                        onChanged: (valor){
                          setState(() => confirmsenha = valor);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: GestureDetector(
                      child: RRegistrarButton(),
                      onTap: (){
                        print("nome: $nome\nemail: $email\nnascimento: $nasc\nsenha: $senha\nconfirmas senha: $confirmsenha");
                      },
                      ),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}