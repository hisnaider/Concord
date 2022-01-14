import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Aplicativo/Components/carregamento.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/models/amigos.dart';
import 'package:concord/Services/models/myuser.dart';
import 'package:concord/Services/models/solicuser.dart';
import 'package:concord/Services/solicitacoes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AmigoCard extends StatelessWidget {
  final AmigosUser contato;

  AmigoCard({required this.contato});

  List<String> mes = ["Jan","Fev","Mar","Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: uid!).otherUserData(this.contato.id),
      builder: (context, snapshot) {
        final contato = snapshot.data;
        if(snapshot.hasData){
          
          DateTime data = this.contato.amigosDesde.toDate();
          return Column(
            children: [
              Card(
                elevation: 0,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        opacity: this.contato.melhoresAmigos ? 0.2 : 0,
                        image: AssetImage("assets/Image/a.png"),
                        fit: BoxFit.contain
                        
                      ),
                    ),
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
                            child: contato.nome == this.contato.apelido 
                              ? Text(this.contato.apelido, style: TextStyle(fontSize: 17),)
                              : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(this.contato.apelido, style: TextStyle(fontSize: 17),),
                                  Text(contato.nome, style: TextStyle(fontSize: 10),)
                                ],)
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            ///height: 30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Relação: ${this.contato.relacao}", style: TextStyle(fontSize: 12),),
                                Text("Amigos desde: ${mes[data.month-1]} de ${data.year}", style: TextStyle(fontSize: 12),)

                              ],
                            ),
                          )
                        )
                      ],
                    ),
                  ),  
                ),
              ),
              Divider(height: 25,thickness: 1,)
            ],
          );
        }
        else return TelaDeLoading();
      }
    );
  }
}