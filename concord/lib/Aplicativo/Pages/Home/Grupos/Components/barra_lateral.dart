import 'dart:io';
import 'dart:ui';

import 'package:concord/Config/cores.dart';
import 'package:concord/Services/auth.dart';
import 'package:concord/Services/myuser.dart';
import 'package:concord/Services/imagens.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class BarraLateral extends StatefulWidget {

  UserData? usuario;

  BarraLateral({ required this.usuario });

  @override
  _BarraLateralState createState() => _BarraLateralState();
}

class _BarraLateralState extends State<BarraLateral> {

  bool edit_perfil = false;
  bool edit_privacidade = false;
  bool edit_tema = false;
  bool sobre_app = false;

  DatabaseImagens img = DatabaseImagens();
  Autenticador auth = Autenticador();

  File? _fotos;
  XFile? foto;

  Future pegarimagem(bool galeria) async {
    ImagePicker picker = ImagePicker();
    XFile? pickedFile;
    if(galeria)pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);
    else pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _fotos = File(pickedFile.path);
        img.salvarimagem(_fotos!, "Usuarios/${widget.usuario?.id}/perfil");
      } else {
        print("nada");
      }
      
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),

      child: Drawer(
        
            child: ListView(
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
                            image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png"),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(cor_primaria.withOpacity(0.9), BlendMode.multiply)
                          )   
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          pegarimagem(true);
                        }, 
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          size: 30,
                        )
                      ),
                      
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 50,
                          width: 50,
                          color: Colors.black,
                          child: Image.network("${FirebaseStorage.instance.ref().child("Sistema/Sem_foto").getDownloadURL()}")
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png"),
                                ),
                              ),
                            Text("${widget.usuario!.nome}",
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