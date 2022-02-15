
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Services/imagens.dart';
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

  List<GlobalKey<FormState>> _formKey = [GlobalKey<FormState>(), GlobalKey<FormState>()];


  String nome = "";
  String sobrenome = "";
  String email = "";
  DateTime? nasc = DateTime.now();
  String senha = "";
  String confirmsenha = "";
  String nickname = "";
  String frase = "";
  bool carregando = false;

  bool emailExiste = false;
  int idade = 18;
  int stepAtual = 0;
  File? _fotoatual;

  DatabaseImagens img = DatabaseImagens();
  Autenticador registrar = Autenticador();

  Future pegarimagem(bool galeria) async {
    ImagePicker picker = ImagePicker();
    XFile? pickedFile;
    if(galeria)pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);
    else pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) return File(pickedFile.path);
    return null;
  }

  Future enviarImagem(String endereco) async {
    await img.salvarimagem(_fotoatual!, endereco);

  }

  int _idade(){
    int anos = DateTime.now().year - nasc!.year;
    int meses = DateTime.now().month - nasc!.month;
    int dias = DateTime.now().day - nasc!.day;
    if(meses < 0 || (meses == 0 && dias < 0)) anos--;
    return anos;
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> colocarImagem(){
      if (_fotoatual != null) return FileImage(_fotoatual!);
      else return NetworkImage(semFoto);
    }
    FirebaseFirestore.instance.collection("EmailsCadastrados").doc(email == "" ? " " : email).get().then((value) => emailExiste = value.exists);
    return carregando ? TelaDeLoading() : Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Registrar"),
        ),
        body: Container(
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
                              child: Text(stepAtual > 0 ? "Voltar" : "", style: TextStyle(fontSize: 25, color: corPrimaria),)
                            ),
                            TextButton(
                              onPressed: details.onStepContinue, 
                              child: Text(stepAtual < 3 ?"Avançar" : "Registrar", style: TextStyle(fontSize: 25, color: corPrimaria))
                            ),
                          ],
                        );
                      },
                      type: StepperType.horizontal,
                      currentStep: stepAtual,
                      steps: [
                        Step(
                          title: Text("Usuario", style: TextStyle(color: Colors.amber, fontSize: 12),),
                          content: Form(
                            key: _formKey[0],
                            child: Container(
                              height: MediaQuery.of(context).size.height - 255,
                              child: stepAtual == 0 
                              ? ListView(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Informações basicas", style: TextStyle(fontSize: 20),)
                                  ),
                                  Row(
                                    children: [
                                      
                                    ],
                                  ),
                          
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical:15),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(right: 5),
                                            child: TextFormField(
                                              textCapitalization: TextCapitalization.words,
                                              validator: (val) {
                                                if(val!.isEmpty) return "Coloque seu primeiro nome"; 
                                                else if (val.contains(" ")) return "O primeiro nome não pode conter espaço";
                                                else return null;
                                              },
                                              keyboardType: TextInputType.text,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(fontSize: 15),
                                              decoration: campotextodec.copyWith(
                                                    hintText: "Primeiro nome*",
                                                    prefixIcon: icone(Icons.person_outline),
                                                    contentPadding: EdgeInsets.only(right: 20)
                                                  ),
                                              onChanged: (valor){
                                                setState(() => nome = valor);
                                              },
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: TextFormField(
                                              textCapitalization: TextCapitalization.words,
                                              validator: (val) => val!.isEmpty ? "Coloque seu sobrenome" : null,
                                              keyboardType: TextInputType.text,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(fontSize: 15),
                                              decoration: campotextodec.copyWith(
                                                    hintText: "Sobrenome*",
                                                    contentPadding: EdgeInsets.symmetric(horizontal: 20)
                                                  ),
                                              onChanged: (valor){
                                                setState(() => sobrenome = valor);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical:15),
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val!.isEmpty) return "Coloque seu email";
                                        else if (!EmailValidator.validate(email)) return "Digite um email valido, carai";
                                        else if(emailExiste) return "Esse email não pode ser usado";
                                        else return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                      decoration: campotextodec.copyWith(
                                            hintText: "Email*",
                                            prefixIcon: icone(Icons.email)
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
                                            border: Border.all(color: idade > 12 ? Colors.white70 : Colors.red,width: 0.7),
                                            borderRadius: BorderRadius.all(Radius.circular(90))
                                          ),
                                          
                                          child: IconButton(
                                            onPressed: (){
                                              showDatePicker(
                                                context: context,
                                                initialDate: nasc!,
                                                firstDate: DateTime(1901),
                                                lastDate: DateTime.now()
                                              ).then((valor) {
                                                setState(() {
                                                  if(valor != null){
                                                    nasc = valor;
                                                  } 
                                                });
                                              });
                                            },
                                            icon: Icon(Icons.calendar_today_outlined,color: Colors.amber,)
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text("Data de nascimento*",style: TextStyle(color: idade > 12 ? corTexto : Colors.red[700]),),
                                            Text(DateFormat('dd/MM/yyyy').format(nasc!),style: TextStyle(fontSize: 25, color: idade> 12 ? corTexto : Colors.red[700]),),
                                          ],
                                        ),
                                      ]
                                    ),
                                  ),
                                  idade < 13 ? Text("Você é menor, vai jogar Fortnite!",style: TextStyle(fontSize: 12 ,color: Colors.red[700])) : SizedBox.shrink()

                                ],
                              )
                              : SizedBox.shrink()
                            ),
                          ),
                        ),
                        
                        Step(
                          title: Text("Senha", style: TextStyle(color: Colors.amber, fontSize: 12),),
                          content: Form(
                            key: _formKey[1],
                            child: Container(
                              height: MediaQuery.of(context).size.height - 255,
                              child: stepAtual == 1 
                              ? ListView(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical:15),
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val!.isEmpty) return "Digite uma senha";
                                        else if (senha.contains(" ")) return "A senha não pode conter espaço";
                                        else if(senha.length < 5) return "A senha é muito pequena";
                                        else return null;
                                        },
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
                                      validator: (val) {
                                        print(val == senha);
                                        if (val!.isEmpty) return "Preencha esse campo";
                                        else if (val != senha ) return "As senhas não estão iguais";
                                        else return null;},
                                      obscureText: true,
                                      keyboardType: TextInputType.text,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                      decoration: campotextodec.copyWith(
                                        hintText: "Confirme sua senha*",
                                        prefixIcon: icone(Icons.vpn_key_outlined)
                                      ),
                                    ),
                                  ),
                                ],
                              )
                              : SizedBox.shrink()
                            ),
                          )
                        ),
                        
                        Step(
                          title: Text("Toque final", style: TextStyle(color: Colors.amber, fontSize: 12),),
                          content: Container(
                            height: MediaQuery.of(context).size.height - 255,
                            child: stepAtual == 2 
                            ? ListView(
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
                                          colorFilter: ColorFilter.mode(corPrimaria.withOpacity(0.9), BlendMode.multiply)
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
                                    textCapitalization: TextCapitalization.words,
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
                                    textCapitalization: TextCapitalization.sentences,
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
                                Container(
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
                            :SizedBox.shrink()
                          )
                        ),
                        Step(
                          title: Text("Revisão", style: TextStyle(color: Colors.amber, fontSize: 12),),
                          content: Container(
                            height: MediaQuery.of(context).size.height - 255,
                            child: stepAtual == 3 
                            ? ListView(
                              children: [
                                
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Text("Nome: ", style: TextStyle(fontSize: 23, color: Colors.amber),),
                                    Text("$nome $sobrenome" ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Text("Email: ", style: TextStyle(fontSize: 23, color: Colors.amber),),
                                    Text("$email"),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Text("Data de nascimento: ", style: TextStyle(fontSize: 23, color: Colors.amber),),
                                    Text(DateFormat('dd/MM/yyyy').format(nasc!)),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      //image: FileImage(_fotos),
                                      image: colocarImagem(),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(corPrimaria.withOpacity(0.9), BlendMode.multiply)
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
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Text("Nickname: ", style: TextStyle(fontSize: 23, color: Colors.amber),),
                                    nickname != "" 
                                      ? Text("$nickname",maxLines: 3,overflow: TextOverflow.ellipsis,)
                                      : Text("Nenhum nickname foi digitado", style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic),)
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Text("Frase: ", style: TextStyle(fontSize: 23, color: Colors.amber),),
                                    Expanded(
                                      flex: 1,
                                      child: frase != "" 
                                        ? Text("$frase",maxLines: 3,overflow: TextOverflow.ellipsis,)
                                        : Text("Nenhuma frase foi digitada", style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic),)
                                      )
                                  ],
                                ),
                              ],
                            )
                            : SizedBox.shrink()
                          )
                        )
                      ],
                      onStepContinue: () async{
                        if(stepAtual == 0)
                        {
                          setState(() {
                          idade = _idade();
                          

                        });
                        }
                        if (stepAtual < 2){
                          if (_formKey[stepAtual].currentState!.validate() && idade > 12){
                            setState(() {
                              stepAtual += 1;
                            });
                          }
                        }
                        else if (stepAtual == 3){
                          registrar.registrarUsuario("$nome $sobrenome", email, Timestamp.fromDate(nasc!), _fotoatual, nickname != "" ? nickname : "$nome $sobrenome", frase, senha);
                          Navigator.pop(context);
                        }
                        else {
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
            ),
          ),
        ),
      ),
    );
  }
}