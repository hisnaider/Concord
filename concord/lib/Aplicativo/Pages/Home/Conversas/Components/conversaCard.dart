import 'package:cached_network_image/cached_network_image.dart';
import 'package:concord/Aplicativo/Components/Carregando.dart';
import 'package:concord/Aplicativo/Components/carregamento.dart';
import 'package:concord/Aplicativo/Pages/Home/Conversas/chat/chat.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/models/conversamodel.dart';
import 'package:concord/Services/models/myuser.dart';
import 'package:flutter/material.dart';


class ConversaCard extends StatelessWidget {
  final ConversaModel conversa;
  const ConversaCard(this.conversa,{ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: uid!).otherUserData(this.conversa.id),
      builder: (context, snapshot) {
        if (snapshot.hasData){
          final contato = snapshot.data;
          return CachedNetworkImage(
            imageUrl: contato!.foto,
            placeholder: (context, url) => Carregando1(),
            imageBuilder: (context, imageProvider) =>
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Chat(nome: contato.nickname, foto: imageProvider,id: contato.id,)));
              },
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: imageProvider,
                      ),
                      Container(
                        width: 125,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(contato.nickname, style: TextStyle(fontSize: 15),),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Text(this.conversa.quemMandou == uid ? "Você: ${this.conversa.ultimaMensagem}" : this.conversa.ultimaMensagem,
                            overflow: TextOverflow.fade,
                            maxLines: 4,
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        else return TelaDeLoading();
      }
    );
  }
}
