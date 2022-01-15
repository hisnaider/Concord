
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:concord/Aplicativo/Components/campotexto.dart';
import 'package:concord/Aplicativo/Components/carregamento.dart';
import 'package:concord/Aplicativo/Pages/Login/Registrar/Components/senhaSegura.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:email_validator/email_validator.dart';



class Registrar extends StatefulWidget {
  const Registrar({ Key? key }) : super(key: key);

  @override
  _RegistrarState createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {

  final _formKey = GlobalKey<FormState>();

  String nome = "";
  String email = "";
  DateTime? nasc = DateTime.now();
  String senha = "";
  String confirmsenha = "";
  String nickname = "";
  String frase = "";
  bool carregando = false;

  bool foto = false;

  int stepAtual = 0;

  File? _fotoatual;

  Future pegarimagem(bool galeria) async {
    ImagePicker picker = ImagePicker();
    XFile? pickedFile;
    if(galeria)pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);
    else pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) return File(pickedFile.path);
    return null;
  }

  

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> colocarImagem(){
    if (_fotoatual != null) return FileImage(_fotoatual!);
    else return NetworkImage(sem_foto);
  }
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
                  child: Stepper(
                    controlsBuilder: (BuildContext context, ControlsDetails details) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: stepAtual > 0 ? details.onStepCancel : null, 
                            child: Text(stepAtual > 0 ? "Voltar" : "", style: TextStyle(fontSize: 25, color: cor_primaria),)
                          ),
                          TextButton(
                            onPressed: details.onStepContinue, 
                            child: Text(stepAtual < 2 ?"Avançar" : "Registrar", style: TextStyle(fontSize: 25, color: cor_primaria))
                          ),
                        ],
                      );
                    },
                    type: StepperType.horizontal,
                    currentStep: stepAtual,
                    steps: [
                      Step(
                        title: Text("Usuario", style: TextStyle(color: Colors.amber),),
                        content: Form(
                          child: Container(
                            height: MediaQuery.of(context).size.height - 255,
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
                                          hintText: "Email*",
                                          prefixIcon: icone(Icons.email_outlined)
                                        ),
                                    onChanged: (valor){
                                      setState(() => email = valor);
                                    },
                                  ),
                                ),
                              
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical:15),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(40, 40, 40,1),                                        
                                          border: Border.all(color: Colors.white,width: 0.5),
                                          borderRadius: BorderRadius.all(Radius.circular(90))
                                        ),
                                        
                                        child: IconButton(
                                          onPressed: (){
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1901),
                                              lastDate: DateTime.now()
                                            ).then((valor) {
                                              setState(() {
                                                nasc = valor;
                                              });
                                            });
                                          },
                                          icon: Icon(Icons.calendar_today_outlined,color: Colors.amber,)
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text("Data de nascimento*"),
                                          Text(DateFormat('dd/MM/yyyy').format(nasc!),style: TextStyle(fontSize: 25),),
                                        ],
                                      )
                                    ]
                                  ),
                                ) 
                              ],
                            )
                          ),
                        )
                      ),
                      Step(
                        title: Text("Senha", style: TextStyle(color: Colors.amber),),
                        content: Container(
                          height: MediaQuery.of(context).size.height - 255,
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
                                        hintText: "Digite sua senha*",
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
                          height: MediaQuery.of(context).size.height - 255,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        //image: FileImage(_fotos),
                                        image: colocarImagem(),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(cor_primaria.withOpacity(0.9), BlendMode.multiply)
                                      )   
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                        child: CircleAvatar(
                                          radius: 60,
                                          backgroundImage: colocarImagem(),
                                        ),
                                      )
                                    )
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                      onPressed: () async {
                                        var asd = await pegarimagem(true);
                                        if (asd != null){
                                          setState(() {
                                            _fotoatual = asd;
                                            foto = true;
                                        });
                                        }
                                      }, 
                                      icon: Icon(Icons.camera_alt_outlined, size: 40,color: Colors.white,)
                                    )
                                  ),
                                  _fotoatual != null 
                                    ? Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        onPressed: () async {
                                          setState(() {
                                            _fotoatual = null;
                                          });
                                        }, 
                                        icon: Icon(Icons.delete_forever_outlined, size: 40,color: Colors.white,)
                                      )
                                    )
                                    : SizedBox.shrink()

                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom:0, top: 50),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Digite um nickname caso você não queira usar seu nome real, mas seja criativo, ou deixe em branco pra usar o nome real mesmo e azar, é us guri!", style: TextStyle(fontSize: 15),)),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical:15),
                                height: 40,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 15),
                                  decoration: campotextodec.copyWith(
                                        contentPadding: EdgeInsets.only(left: 15),
                                        hintText: "Nickname",
                                      ),
                                  onChanged: (valor){
                                    setState(() => nickname = valor);
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 25),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Digite uma frase maneira pra todos verem e pensarem 'uau, que frase maneira!!!'", style: TextStyle(fontSize: 15),)),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical:15),
                                height: 40,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 15),
                                  decoration: campotextodec.copyWith(
                                    contentPadding: EdgeInsets.only(left: 15),
                                        hintText: "Digite uma frase maneira",
                                      ),
                                  onChanged: (valor){
                                    setState(() => frase = valor);
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 25),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text("OBS: Essas informações podem ser colocadas mais tarde")
                                  ),
                                ),
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
          ],
        ),
      ),
    );
  }
}