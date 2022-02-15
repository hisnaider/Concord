import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Aplicativo/Components/Carregando.dart';
import 'package:concord/Aplicativo/Components/todosOverlay.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/models/contatos.dart';
import 'package:concord/Services/models/solicuser.dart';
import 'package:concord/Services/solicitacoes.dart';
import 'package:flutter/material.dart';




// ignore: must_be_immutable
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
                return CachedNetworkImage(
                  imageUrl: this.contato.foto,
                  placeholder: (context, url) => Carregando1(),
                  imageBuilder: (context, imageProvider) => 
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(PageRouteBuilder(barrierDismissible: true,opaque: false,pageBuilder: (_, __, ___) => PerfilUser(
                          foto: imageProvider,
                          nickname: this.contato.nickname,
                          frase: this.contato.frase,
                          id: this.contato.id,
                          nome: this.contato.nome,
                          mostrarAmigos: this.contato.mostrarAmigos,
                          mostrarNomeReal: this.contato.mostrarNomeReal,
                          mostrarBirth: this.contato.mostrarBirth,
                          birth: this.contato.birth,
                          amigos: amigos == true)));
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              GestureDetector(
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: imageProvider,
                                ),
                                onTap: (){
                                  Navigator.of(context).push(PageRouteBuilder(barrierDismissible: true,opaque: false,pageBuilder: (_, __, ___) => FullscreenImage(foto:imageProvider)));
                                },
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(this.contato.nickname, style: TextStyle(fontSize: 15),),
                                ),
                              ),
                              Text(texto!),
                              IconButton(
                                onPressed: () async {                  
                                  if(amigos != true)solic.enviarSolic(contato.id);
                                  //check();
                                },
                                icon: icone!)
                            ],
                          ),
                        ),
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