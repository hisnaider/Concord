import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Aplicativo/Components/campotexto.dart';
import 'package:concord/Aplicativo/Components/carregamento.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/models/addamigo.dart';
import 'package:concord/Services/models/amigos.dart';
import 'package:concord/Services/models/contatos.dart';
import 'package:concord/Services/models/listaamigos.dart';
import 'package:concord/Services/models/myuser.dart';
import 'package:concord/Services/models/solicuser.dart';
import 'package:concord/Services/solicitacoes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

/*class UserCard extends StatefulWidget {
  final ContatosUser contato;
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
    return StreamBuilder<Object>(
      stream: DatabaseService(uid: uid!).otherUserData(this.contato.id),
      builder: (context, snapshot) {
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
    );
  }
}*/


class UserCard extends StatelessWidget {
  final ContatoUser contato;
  bool amigos = false;
  bool convite = false;
  DocumentReference doc;
  UserCard({required this.contato, required this.doc});

  Solicitacoes solic = Solicitacoes();


  Icon? icone = Icon(Icons.send);
  String? texto = "Enviar Solicitação";

 

  @override
  Widget build(BuildContext context) {
    



    return StreamBuilder<SolicUser>(
      stream: DatabaseService(uid: contato.id).solicUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final solici = snapshot.data?.solic.toList();
          return StreamBuilder(
            stream: DatabaseService(uid: uid!).listaamigos(contato.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final amigos = snapshot.data;
                print(amigos);
                if (solici?.contains(uid) == true)
                {
                  icone = Icon(Icons.done);
                  texto = "Solicitação enviada";
                }
                else if (amigos == true)
                {
                  icone = Icon(Icons.person);
                  texto = "Amigo/a";
                }
                return Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(this.contato.foto,),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(this.contato.nome, style: TextStyle(fontSize: 15),),
                          ),
                        ),
                        Text(texto!),
                        IconButton(
                          onPressed: () async {                  
                            solic.enviarSolic(contato.id);
                            //check();
                          },
                          icon: icone!)
                      ],
                    ),
                  ),
                );
              }
              else return SizedBox.shrink();
            }
          );
        }
        else return SizedBox.shrink();
      }
    );
  }
}