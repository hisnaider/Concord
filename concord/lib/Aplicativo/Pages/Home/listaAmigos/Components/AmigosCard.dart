import 'package:cached_network_image/cached_network_image.dart';
import 'package:concord/Aplicativo/Components/Carregando.dart';
import 'package:concord/Aplicativo/Components/carregamento.dart';
import 'package:concord/Aplicativo/Components/todosOverlay.dart';
import 'package:concord/Aplicativo/Pages/Home/Conversas/chat/chat.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/models/amigos.dart';
import 'package:concord/Services/models/myuser.dart';
import 'package:flutter/material.dart';

class AmigoCard extends StatelessWidget {
  final AmigosUser contato;

  AmigoCard({required this.contato});

  final List<String> mes = ["Jan","Fev","Mar","Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: uid!).otherUserData(this.contato.uid),
      builder: (context, snapshot) {
        final contato = snapshot.data;
        if(snapshot.hasData){
          DateTime data = this.contato.amigosDesde.toDate();
          return CachedNetworkImage(
            imageUrl: contato!.foto,
            placeholder:(context, url) => Carregando2(),
            imageBuilder: (context, imageProvider) => 
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Chat(
                        foto: imageProvider,
                        nome: this.contato.apelido,
                        id: contato.id,
                        
                      )));
                    },
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(PageRouteBuilder(barrierDismissible: true,opaque: false,pageBuilder: (_, __, ___) => FullscreenImage(foto:imageProvider)));
                                },
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: imageProvider
                                ),
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
              ),
          );
        }
        else return TelaDeLoading();
      }
    );
  }
}