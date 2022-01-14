import 'package:concord/Aplicativo/Components/campotexto.dart';
import 'package:concord/Aplicativo/Components/carregamento.dart';
import 'package:concord/Aplicativo/Pages/Login/Registrar/Components/button.dart';
import 'package:concord/Aplicativo/Pages/Login/Registrar/Components/senhaSegura.dart';
import 'package:concord/Aplicativo/Pages/Login/login.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/auth.dart';
import 'package:flutter/material.dart';


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
  bool carregando = false;

  int stepAtual = 0;

  @override
  Widget build(BuildContext context) {
    return carregando ? TelaDeLoading() : Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Registrar"),
        ),
        body: Column(
          children: [
            
            Expanded(
              flex: 4,
              child: Center(
                child: Container(
                  child: Form(
                    key: _formKey,
                    child: Stepper(
                      controlsBuilder: (BuildContext context, ControlsDetails details) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: details.onStepCancel, 
                              child: Text("Voltar", style: TextStyle(fontSize: 25, color: cor_primaria),)
                            ),
                            TextButton(
                              onPressed: details.onStepContinue, 
                              child: Text("Avançar", style: TextStyle(fontSize: 25, color: cor_primaria))
                            ),
                          ],
                        );
                      },
                      type: StepperType.horizontal,
                      currentStep: stepAtual,
                      steps: [
                        Step(
                          
                          title: Text("Usuario", style: TextStyle(color: Colors.amber),),
                          content: Container(
                            height: MediaQuery.of(context).size.height - 235,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Informações basicas", style: TextStyle(fontSize: 20),)
                                ),
                                
                                Container(
                                  margin: EdgeInsets.symmetric(vertical:15),
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty ? "Coloque seu nome" : null,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 15),
                                    decoration: campotextodec.copyWith(
                                          hintText: "Nome Completo*",
                                          prefixIcon: icone(Icons.person_outline)
                                        ),
                                    onChanged: (valor){
                                      setState(() => nome = valor);
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical:15),
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty ? "Coloque seu email" : null,
                                    keyboardType: TextInputType.emailAddress,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 15),
                                    decoration: campotextodec.copyWith(
                                          hintText: "Digete seu email*",
                                          prefixIcon: icone(Icons.email_outlined)
                                        ),
                                    onChanged: (valor){
                                      setState(() => nasc = valor);
                                    },
                                  ),
                                ),
                              
                                Container(
                                  margin: EdgeInsets.symmetric(vertical:15),
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty ? "Coloque sua data de nascimento" : null,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 15),
                                    decoration: campotextodec.copyWith(
                                          hintText: "Data de nascimento*",
                                          prefixIcon: icone(Icons.cake_outlined)
                                        ),
                                    onChanged: (valor){
                                      setState(() => nasc = valor);
                                    },
                                  ),
                                ),
                                
                              ],
                            )
                          )
                        ),
                        Step(
                          title: Text("Senha", style: TextStyle(color: Colors.amber),),
                          content: Container(
                            height: MediaQuery.of(context).size.height - 235,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical:15),
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty ? "Coloque uma senha" : null,
                                    obscureText: true,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 15),
                                    decoration: campotextodec.copyWith(
                                          hintText: "Digete sua senha*",
                                          prefixIcon: icone(Icons.vpn_key_outlined)
                                        ),
                                    onChanged: (valor){
                                      setState(() => senha = valor);
                                    },
                                  ),
                                ),
                                SenhaSegura(senha: senha),
                                Container(
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty ? "Coloque uma senha" : null,
                                    obscureText: true,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 15),
                                    decoration: campotextodec.copyWith(
                                          hintText: "Confirme sua senha*",
                                          prefixIcon: icone(Icons.vpn_key_outlined)
                                        ),
                                    onChanged: (valor){
                                      setState(() => senha = valor);
                                    },
                                  ),
                                ),
                              ],
                            )
                          )
                        ),
                        
                        Step(
                          title: Text("Toque final", style: TextStyle(color: Colors.amber),),
                          content: Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical:15),
                                  height: 40,
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty ? "Coloque sua data de nascimento" : null,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 15),
                                    decoration: campotextodec.copyWith(
                                          hintText: "Nickname",
                                          prefixIcon: icone(Icons.person)
                                        ),
                                    onChanged: (valor){
                                      setState(() => nasc = valor);
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                    onPressed: (){}, 
                                    icon: Icon(Icons.camera_alt_outlined, size: 40,color: cor_primaria,)
                                  )
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      //image: FileImage(_fotos),
                                      image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png"),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(cor_primaria.withOpacity(0.9), BlendMode.multiply)
                                    )   
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png"),
                                      ),
                                    )
                                  )
                                ),
                              ],
                            )
                          )
                        )
                      ],
                      onStepContinue: (){
                        if (stepAtual < 2) {
                          setState(() {
                            stepAtual += 1;
                          });
                        }
                      },
                      onStepCancel: (){
                        if (stepAtual > 0) {
                          setState(() {
                            stepAtual -= 1;
                          });
                        }
                      },
                    ),
                    /*child: Column(
                      children: [
                        Container(
                          height: 85,
                          child: TextFormField(
                            validator: (val) => val!.isEmpty ? "Coloque seu nome" : null,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 17),
                            decoration: campotextodec.copyWith(
                                  hintText: "Nome de usuario",
                                  prefixIcon: icone(Icons.person_outline)
                                ),
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
                            validator: (val) => val!.isEmpty ? "Coloque a data do seu nascimento" : null,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 17),
                            decoration: campotextodec.copyWith(
                                  hintText: "Data de aniversario",
                                  prefixIcon: icone(Icons.cake_outlined)
                                ),
                            onChanged: (valor){
                              setState(() => nasc = "$valor");
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
                          height: 85,
                          child: TextFormField(
                            validator: (val) => val! != senha ? "As senhas não são iguais" : null,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 17),
                            decoration: campotextodec.copyWith(
                                  hintText: "Confirmar senha",
                                  prefixIcon: icone(Icons.vpn_key_outlined)
                                ),
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
                                setState(() => carregando = true);
                                dynamic resultado = await _auth.registrarUsuario(nome, email, nasc, senha);
                                if (resultado == null){
                                  setState(() => carregando = false);
                                }
                              }
                              Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>Login()));
                            },
                          ),
                        )
                      ],
                    ),*/
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}