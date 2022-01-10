import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Aplicativo/Components/campotexto.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/models/addamigo.dart';
import 'package:concord/Services/models/contatos.dart';
import 'package:concord/Services/solicitacoes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  final AddUser contato;
  bool amigos = false;
  bool convite = false;
  DocumentReference doc;
  UserCard({required this.contato, required this.doc});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {

  Solicitacoes solic = Solicitacoes();


  Icon? icone;
  String? texto = "";
  bool completo = false;

  check() async {
    widget.doc.get().then((value) {
      setState(() {
        widget.convite = value.exists;
        widget.amigos = value.get("amigos");
      });
    });
    
    if(widget.convite) {
      if (widget.amigos) {
          icone = Icon(Icons.person);
          texto = "Amigos";
        }
        else {
          icone = Icon(Icons.done);
          texto = "Enviado";
        }
    }
    else{
      icone = Icon(Icons.send);
      texto = "Enviar";
    }
    return Container();
  }

  @override
  
  Widget build(BuildContext context) {
    check();
    return Card(
        elevation: 0,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(this.widget.contato.foto,),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(this.widget.contato.nome, style: TextStyle(fontSize: 15),),
                ),
              ),
              Text(texto!),
              IconButton(
                onPressed: () async {                  
                  solic.enviarSolic(widget.contato.id);
                  check();
                },
                icon: icone!)
            ],
          ),
        ),
    );
  }
}