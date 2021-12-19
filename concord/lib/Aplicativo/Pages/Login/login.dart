import 'package:concord/Aplicativo/Components/campotexto.dart';
import 'package:concord/Aplicativo/Components/carregamento.dart';
import 'package:concord/Config/cores.dart';
import 'package:concord/Services/auth.dart';
import 'package:flutter/material.dart';

import 'Components/button.dart';



class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Autenticador _auth = Autenticador();
  final _formKey = GlobalKey<FormState>();


  String email="";
  String senha="";

  String erro= "";
  bool aviso = false;
  bool carregando = false;

  void initState() {
    super.initState();
    erro = "";
    aviso = false;
  
  }

  @override
  Widget build(BuildContext context) {
    return carregando ? TelaDeLoading() : Material(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(color: cor_primaria,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Visibility(
                      visible: aviso,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        height: 50,
                        width: 250,
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                        child: Center(
                          child: Text(erro, style: TextStyle(fontSize: 15, color: Colors.red),)),
                      ),
                    )
                  ],
                )
              ],
            ),

          ),
          Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    child: Text("Login", style: TextStyle(fontSize: 30),)),
                ),    
          Expanded(
            flex: 4,
            child: Container(
              width: MediaQuery.of(context).size.width-100,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [           
                    Container(
                            height: 85,
                            child: TextFormField(
                              validator: (val) => val!.isEmpty ? "Coloque seu email" : null,
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 17),
                              decoration: campotextodec.copyWith(
                                hintText: "Email",
                                prefixIcon: icone(Icons.email_outlined)
                              ),
                              onChanged: (valor){
                                setState(() => email = valor);
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
                              decoration: campotextodec.copyWith(
                                hintText: "Senha",
                                prefixIcon: icone(Icons.vpn_key_outlined)
                              ),
                              onChanged: (valor){
                                setState(() => senha = valor);
                              },
                            ),
                          ),  
                    Container(
                      width:double.infinity,
                      child: Text("Esqueci minha senha")
                    ),
                          
                    Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 5),
                      child: GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),color: cor_primaria),
                            child: Center(
                              child: Text("Entrar",style: TextStyle(fontSize: 22,color: Colors.black),
                              )
                            ),
                        ),
                        onTap: () async {
                            if (_formKey.currentState!.validate()){
                              setState(() => carregando = true);
                              dynamic resultado = await _auth.logarusuario(/*nome,*/ email, /*nasc,*/ senha);
                              if (resultado == null){
                                setState(() {
                                  aviso = true;
                                  erro = "O email e/ou a senha esta errado";
                                  carregando = false;
                                });
                              }
                              
                            }
                          },
                      ),
                    ),
                    /*GestureDetector(
                      onTap: () async {
                        dynamic resultado = await _auth.sign();
                        if (resultado == null) print("erro");
                        else {
                          print("certo");
                          print(resultado.id);
                        }
                      },
                      child: Text("Click aqui pra logar de forma anonima"),
                    ),*/
                          
                    Divider(
                      height: 40,
                      color: Colors.black
                    ),
                    ///Container(height: 2,width: 500,color: Colors.grey[800],),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Center(child: Text("Caso não tenha uma conta, crie uma, é de graça!!!",style: TextStyle(fontSize: 17),textAlign: TextAlign.center,)),
                    ),
                    RegistrarButton(),
                        
                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}