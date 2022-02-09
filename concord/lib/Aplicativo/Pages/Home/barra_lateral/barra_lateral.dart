import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Aplicativo/Pages/Home/Home.dart';
import 'package:concord/Aplicativo/Pages/Home/barra_lateral/Components/editarPerfil.dart';
import 'package:concord/Aplicativo/Pages/Home/barra_lateral/Components/editarPriv.dart';
import 'package:concord/Aplicativo/Pages/Home/barra_lateral/Components/mudarNome.dart';
import 'package:concord/Aplicativo/Pages/Home/barra_lateral/Components/mudarfrase.dart';
import 'package:concord/Aplicativo/Pages/Home/barra_lateral/Components/sobreApp.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/auth.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/models/myuser.dart';
import 'package:concord/Services/imagens.dart';
import 'package:concord/Services/solicitacoes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class BarraLateral extends StatefulWidget {

  UserData? usuario;
  DatabaseService? database;

  BarraLateral({ required this.usuario, required this.database});

  @override
  _BarraLateralState createState() => _BarraLateralState();
}

class _BarraLateralState extends State<BarraLateral> {

  Solicitacoes teste = Solicitacoes();

  bool edit_perfil = false;
  bool edit_privacidade = false;
  bool edit_tema = false;
  bool sobre_app = false;

  int nomeReal = 0;

  List<String> privOptions = ["Todos","Apenas amigos", "Ninguem"];


  String? _nicknameatual;
  String? _nomeatual;
  Timestamp? _birthatual;
  String? _fotoatual;
  String? _fraseatual;

  DatabaseImagens img = DatabaseImagens();
  Autenticador auth = Autenticador();

  Home home = Home();

  File? _fotos;
  XFile? foto;
  
  Future pegarimagem(bool galeria, String endereco) async {
    Reference ref = FirebaseStorage.instance.ref().child(endereco);
    ImagePicker picker = ImagePicker();
    XFile? pickedFile;
    if(galeria)pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);
    else pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
        await img.salvarimagem(File(pickedFile.path), endereco);
        String url = await ref.getDownloadURL();
        return url.toString();
      } else {
        print("nada");
        
      }
    return _fotoatual;
  }

  @override
  Widget build(BuildContext context) {
    _nicknameatual = widget.usuario?.nickname;
    _nomeatual = widget.usuario?.nome;
    _birthatual = widget.usuario?.birth;
    _fotoatual = widget.usuario?.foto;
    _fraseatual = widget.usuario?.frase;

    print(nomeReal);

    return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),

      child: Drawer(
        
            child: Column(
              children: [
                DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            //image: FileImage(_fotos),
                            image: NetworkImage(_fotoatual!),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(cor_primaria.withOpacity(0.9), BlendMode.multiply)
                          )   
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          String asd = await pegarimagem(true, "Usuarios/${widget.usuario?.id}/perfil/foto_perfil");

                          setState(() {
                            _fotoatual = asd;
                            
                          });
                          await FirebaseFirestore.instance.collection("Usuarios").doc(widget.usuario!.id).update({
                            "foto": _fotoatual
                          });
                        }, 
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          size: 30,
                        )
                      ),
                      
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(_fotoatual!),
                                ),
                              ),
                            Text(_nicknameatual!,
                            style: TextStyle(
                              fontSize: 20,
                              color: cor_texto,
                              ),
                            )
                          ],
                        ),
                      )
                    ]
                  ),    
                ),
                ListTile(
                  leading: Icon(Icons.person_outline_outlined),
                  trailing: edit_perfil ? Icon(Icons.remove) : Icon(Icons.add_outlined),
                  title: Text("Editar perfil"),
                  onTap: () {
                    setState(() {
                      edit_perfil = !edit_perfil;
                      }
                    );
                  },
                ),
                EditarPerfil(widget.usuario!.frase, edit_perfil, widget.usuario!.nickname),
                ListTile(
                  leading: Icon(Icons.enhanced_encryption_outlined),
                  trailing: edit_privacidade ? Icon(Icons.remove) : Icon(Icons.add_outlined),
                  title: Text("Editar privacidade"),
                  onTap: () {
                    setState(() {
                      edit_privacidade = !edit_privacidade;
                      }
                    );
                  },
                ),
                EditarPriv(edit_privacidade, widget.usuario!.mostrarNomeReal, widget.usuario!.mostrarAmigos, widget.usuario!.mostrarBirth),
                ListTile(
                  leading: Icon(Icons.settings_outlined),
                  trailing: Icon(Icons.add_outlined),
                  title: Text("Editar tema"),
                  onTap: () {
                    setState(() {
                      edit_tema = !edit_tema;
                      }
                    );
                  },
                ),
                Visibility(
                  visible: edit_tema,
                  child: Container(
                    height: 50,
                    color: Colors.grey[800],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.info_outline),
                  trailing: Icon(Icons.add_outlined),
                  title: Text("Sobre o app"),
                  onTap: () {
                    setState(() {
                      sobre_app = !sobre_app;
                      }
                    );
                  },
                ),
                
                SobreApp(sobre_app),
                ListTile(
                  leading: Icon(Icons.logout_outlined),
                  title: Text("Deslogar"),
                  onTap: () {
                    setState(() {
                      auth.deslogar();
                      }
                    );
                  },
                ),
                Expanded(flex: 1,child: SizedBox(),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "UID: ${widget.usuario!.id}",
                      style: TextStyle(fontSize: 15, color: cor_texto.withOpacity(0.2)),
                    )
                  ),
                )
              ],
            )
          ),
    );
  }
}