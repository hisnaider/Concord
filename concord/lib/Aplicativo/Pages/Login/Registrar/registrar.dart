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
  final _formKey = GlobalKey<FormState>();

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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              child: Text("Registrar", style: TextStyle(fontSize: 30),
              )
            ),
          ),
          Expanded(
            flex: 4,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width-100,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        height: 85,
                        child: TextFormField(
                          validator: (val) => val!.isEmpty ? "Coloque seu nome" : null,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 17),
                          decoration: decuser,
                          onChanged: (valor){
                            setState(() => nome = valor);
                          },
                        ),
                      ),
                      Container(
                        height: 85,
                        child: TextFormField(
                          validator: (val) => val!.isEmpty ? "Coloque seu email" : null,
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 17),
                          decoration: decemail,
                          onChanged: (valor){
                            setState(() => email = valor);
                          },
                        ),
                      ),
                      Container(
                        height: 85,
                        child: TextFormField(
                          validator: (val) => val!.isEmpty ? "Coloque a data do seu nascimento" : null,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 17),
                          decoration: decbirth,
                          onChanged: (valor){
                            setState(() => nasc = "asdasd$valor");
                          },
                        ),
                      ),
                      Container(
                        height: 85,
                        child: TextFormField(
                          validator: (val) => val!.length < 5 ? "A senha deve ter no mínimo 6 caracteres " : null,
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
                      Container(
                        height: 85,
                        child: TextFormField(
                          validator: (val) => val! != senha ? "As senhas não são iguais" : null,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: GestureDetector(
                          child: RRegistrarButton(),
                          onTap: () async {
                            if (_formKey.currentState!.validate()){
                              dynamic resultado = await _auth.RegistrarUsuario(nome, email, nasc, senha);
                            }      
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}