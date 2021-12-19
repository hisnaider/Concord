import 'package:concord/Config/cores.dart';
import 'package:flutter/material.dart';

class BarraLateral extends StatefulWidget {
  const BarraLateral({ Key? key }) : super(key: key);

  @override
  _BarraLateralState createState() => _BarraLateralState();
}

class _BarraLateralState extends State<BarraLateral> {

  bool edit_perfil = false;
  bool edit_privacidade = false;
  bool edit_tema = false;
  bool sobre_app = false;
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
          
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: cor_primaria),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png"),
                      ),
                    ),
                    Text("Nome Completo",style: TextStyle(fontSize: 20),)
                  ],
                )
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
                  height: 50,
                  color: Colors.grey[800],
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
            ],
          )
        );
  }
}