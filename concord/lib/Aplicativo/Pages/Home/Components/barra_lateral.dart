import 'dart:io';
import 'dart:ui';

import 'package:concord/Aplicativo/Pages/Home/Home.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/auth.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/models/myuser.dart';
import 'package:concord/Services/imagens.dart';
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

  bool edit_perfil = false;
  bool edit_privacidade = false;
  bool edit_tema = false;
  bool sobre_app = false;

  String? _nomeatual;
  String? _birthatual;
  String? _fotoatual;

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
    _nomeatual = widget.usuario?.nome;
    _birthatual = widget.usuario?.birth;
    _fotoatual = widget.usuario?.foto;
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
                          await widget.database?.atualizarDadosUser(
                              _nomeatual!, 
                              _birthatual!, 
                              _fotoatual!
                            );
                          
                          
                          
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
                            Text(_nomeatual!,
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
                Visibility(
                  visible: edit_perfil,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 30, 10, 30),
                    color: Colors.grey[800],
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nome de usuario: "),
                            Expanded(
                              flex: 1,
                              
                              child: TextFormField(
                                initialValue: widget.usuario!.nome,
                                validator: (val) => val!.isEmpty ? "Digite um nome" : null,
                                textAlign: TextAlign.left,
                              
                                decoration: InputDecoration(
                                  hintText: "digite o nome",
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  ),                                
                                onChanged: (valor){
        
                                  },
                              ),
                            ),
                        ],)
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.enhanced_encryption_outlined),
                  trailing: Icon(Icons.add_outlined),
                  title: Text("Editar privacidade"),
                  onTap: () {
                    setState(() {
                      edit_privacidade = !edit_privacidade;
                      }
                    );
                  },
                ),
                Visibility(
                  visible: edit_privacidade,
                  child: Container(
                    height: 50,
                    color: Colors.grey[800],
                  ),
                ),
    
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
                
                Visibility(
                  visible: sobre_app,
                  child: Container(
                    height: 50,
                    color: Colors.grey[800],
                  ),
                ),
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
              ],
            )
          ),
    );
  }
}