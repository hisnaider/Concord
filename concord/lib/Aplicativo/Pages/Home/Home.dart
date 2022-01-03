
///import 'package:concord/Aplicativo/Home/Components/HomeController.dart';
///import 'dart:io';
import 'package:concord/Aplicativo/Components/carregamento.dart';
import 'package:concord/Aplicativo/Pages/Home/Components/barra_lateral.dart';
import 'package:concord/Aplicativo/Pages/Home/addAmigo/addAmigo.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/contatos.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/imagens.dart';
import 'package:concord/Services/myuser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'contatoslista.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  DatabaseImagens img = DatabaseImagens();
  //final Autenticador _auth = Autenticador(); 

  bool conversa = true;
  bool color_picker = false;

  
  @override


  Widget build(BuildContext context) {

    final user = Provider.of<Myuser?>(context);

    nomeUser(user!.id);


    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.id).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData? userdata = snapshot.data;
          return StreamProvider<List<ContatosUser>?>.value(
            value: DatabaseService(uid: '').contatos,
            initialData: [],
            child: Scaffold(
              drawer: BarraLateral(usuario: userdata, database: DatabaseService(uid: user.id),),
              appBar: AppBar(
                iconTheme: IconThemeData(color: cor_texto),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent
                ),
                backgroundColor: cor_primaria,
                elevation: 5,
                actions: [
                  
                  Icon(Icons.search, color: cor_texto),
                  IconButton(
                    onPressed: () {}, 
                    icon: Icon(Icons.settings, color: cor_texto,)
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        color_picker = !color_picker;
                      });
                    }, 
                    icon: Icon(Icons.color_lens_outlined,color: cor_texto)
                  ),
              ],  
            ),
            body: Column(
              children: [
                Expanded(
                child: Column(
                  children: [
                    //ContatosLista(),
                    ContatosLista(),
                    Container(
                      height: 50,
                      width: double.infinity,
                      color: cor_primaria,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /*Expanded(
                            flex: 1,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.chat_outlined,color: cor_texto, size: 30,),
                              onPressed: () {  

                              },
                            )
                          ),*/
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.list_rounded, color: cor_texto, size: 30,),
                              onPressed: () {  

                              },
                            )
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.person_add_alt_outlined,color: cor_texto, size: 30,),
                              onPressed: () {  
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddAmigos(userid: user.id,)));
                              },
                            )
                          ),
                                  
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: color_picker,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(top: 40),
                    height: 300,
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Container(
                        width: 250,
                        child: ColorPicker(
                          pickerColor: cor_primaria,
                          colorPickerWidth: 300,
                          pickerAreaHeightPercent: 0.4,
                          enableAlpha: false,
                          displayThumbColor: true,
                          pickerAreaBorderRadius: BorderRadius.all(Radius.circular(5)),
                          onColorChanged: (Color value) {
                            setState(() {
                              trocar_cor_primaria(value);
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        );
      }
      else return TelaDeLoading();
      }
    );
  }
}






/*/*Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: (){
                                print(FirebaseFirestore.instance.collection("Usuarios").doc(user.id).collection("AmiCgos").get());
                                setState(() {
                                  if (!conversa) conversa = !conversa;
                                  }
                                );
                              }, 
                              style:button(conversa),
                              child: Text(
                                "Amigos",
                                style: TextStyle(
                                  color: cor_texto
                                ),
                              )
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: (){
                                setState(() {
                                  if (conversa) conversa = !conversa;
                                    trocar_cor_primaria(Colors.green);
                                  }
                                );
                              }, 
                              style:button(!conversa),
                              child: Text(
                                "Grupos",
                                style: TextStyle(
                                  color: cor_texto
                                ),
                              )
                            ),
                          ),
                        ],
                      ),*/*/