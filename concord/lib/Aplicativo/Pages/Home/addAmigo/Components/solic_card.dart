import 'package:concord/Aplicativo/Components/carregamento.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/models/myuser.dart';
import 'package:concord/Services/models/solicuser.dart';
import 'package:concord/Services/solicitacoes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SolicCard extends StatelessWidget {
  final String id;

  SolicCard({required this.id});

  

  @override
  Widget build(BuildContext context) {
    Solicitacoes solic = Solicitacoes();
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: uid!).otherUserData(this.id),
      builder: (context, snapshot) {
        final contato = snapshot.data;
        if (snapshot.hasData){
          return Card(
            elevation: 0,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(contato!.foto),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(contato.nome, style: TextStyle(fontSize: 15),),
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          solic.rejeitarsolic(contato.id);
                        },
                        icon: Icon(Icons.not_interested)
                      ),
                      Text("rejeitar"),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          solic.aceitarsolic(contato.id);
                        },
                        icon: Icon(Icons.add_circle_outline)
                      ),
                      Text("aceitar"),
                    ],
                  ),
                  
                ],
              ),
            ),
        );
        }
        else return TelaDeLoading(); 
      }
    );
  }
}