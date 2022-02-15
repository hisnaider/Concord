import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Aplicativo/Components/carregamento.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/models/amigos.dart';
import 'package:concord/Services/models/myuser.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



/*void overlayFoto(BuildContext context, String foto){
  OverlayState? overlayState = Overlay.of(context);
  OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(builder: (context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Material(
        child: Stack(
          children: [
            Positioned(
              child: IconButton(
                onPressed: () => print("object"),
                icon: Icon(Icons.arrow_back_outlined)
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.red,
                /*child: Image(
                  image: NetworkImage(foto),
                  fit: BoxFit.contain,
                )*/
              ),
            ),
          ],
        ),
      ),
    );
  });
  overlayState?.insert(overlayEntry);
}*/


class FullscreenImage extends StatelessWidget {
  final ImageProvider foto;
  FullscreenImage({required this.foto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Stack(
          children: [
            GestureDetector(
              onTap: (){Navigator.pop(context);},
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black54,
              ),
            ),
            Container(
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image(
                    image: foto,
                    fit: BoxFit.contain,
                  )
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class PerfilUser extends StatelessWidget {
  final ImageProvider foto;
  final String nickname;
  final String frase;
  final String id;
  final String nome;
  final int mostrarAmigos;
  final int mostrarNomeReal;
  final int mostrarBirth;
  final bool amigos;
  final Timestamp birth;
  PerfilUser({required this.amigos, 
    required this.foto, 
    required this.nickname, 
    required this.frase, 
    required this.id, 
    required this.nome, 
    required this.mostrarAmigos, 
    required this.mostrarNomeReal, 
    required this.mostrarBirth, 
    required this.birth});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Stack(
          children: [
            GestureDetector(
              onTap: (){Navigator.pop(context);},
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black54,
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.8,
                  color: Theme.of(context).backgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children:[ 
                          Container(
                            width: double.infinity,
                            height: 125,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                //image: FileImage(_fotos),
                                image: this.foto,
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(corPrimaria.withOpacity(0.9), BlendMode.multiply)
                              )   
                            ),
                            child: Center(
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: this.foto,
                              ),
                            )
                          ),
                          IconButton(
                            onPressed: (){Navigator.pop(context);},
                            icon: Icon(Icons.close_rounded,size: 50,)
                          )
                        ]
                      ),
                    
                      SizedBox(height: 20),
                      Center(
                        child:Text(this.nickname, style: TextStyle(fontSize: 30),),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.black.withOpacity(0.4),
                        child: Center(
                          child: Text(
                            this.frase, 
                            style: TextStyle(
                              fontStyle: FontStyle.italic
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (this.mostrarBirth == 0 || (this.mostrarBirth == 1 && amigos))
                            ?Text("Nascimento: ${DateFormat('dd/MM/yyyy').format(this.birth.toDate())}", style: TextStyle(fontSize: 18),)
                            :Text("Nascimento: Privado}", style: TextStyle(fontSize: 18, color: Colors.grey[600], fontStyle: FontStyle.italic),),
                            SizedBox(height: 10),
                            (this.mostrarNomeReal == 0 || (this.mostrarNomeReal == 1 && amigos))
                            ?Text("Nome real: ${this.nome}", style: TextStyle(fontSize: 18),)
                            :Text("Nome real: Privado}", style: TextStyle(fontSize: 18, color: Colors.grey[600], fontStyle: FontStyle.italic),),
                
                            Divider(height: 20,color: Colors.black.withOpacity(0.5), thickness: 2,)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Amigos:", style: TextStyle(fontSize: 20),
                        )
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.black.withOpacity(0.4),
                          child: (this.mostrarAmigos == 0 || (this.mostrarAmigos == 1 && amigos))
                          ? StreamBuilder<List<AmigosUser>>(
                            stream: DatabaseService(uid: this.id).amigos(),
                            builder: (context, snapshot){
                              if (snapshot.hasData) {
                                final amigos = snapshot.data?.toList();
                                return Padding(
                                  padding: const EdgeInsets.only(left:10,right: 10 , top: 0),
                                  child: ListView.builder(     
                                    padding: EdgeInsets.symmetric(vertical: 10),  
                                    itemCount: amigos!.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      
                                      return StreamBuilder<UserData>(
                                        stream: DatabaseService(uid: this.id).otherUserData(amigos[index].uid),
                                        builder: (context, snapshot) {
                                          final amigouser = snapshot.data;
                                          if(snapshot.hasData){
                                            return Card(
                                              elevation: 0,
                                              color: Colors.transparent,
                                              child:Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 5),
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 25,
                                                        backgroundImage: NetworkImage(amigouser!.foto),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          margin: EdgeInsets.symmetric(horizontal: 10),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(amigouser.nickname, style: TextStyle(fontSize:17),),
                                                              Text("Relação: ${amigos[index].relacao}", style: TextStyle(fontSize: 12),),
                                                            ],
                                                          )
                                                            
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),  
                                            );
                                          }
                                          else return TelaDeLoading();
                                        }
                                      );
                                    },
                                  ),
                                );
                              }
                              else return TelaDeLoading();
                            }
                          )
                          : Center(child: Text("Há nada pra ver aqui", style: TextStyle(fontSize: 18),),)
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}