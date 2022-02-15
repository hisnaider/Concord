import 'package:concord/Aplicativo/Components/carregamento.dart';
import 'package:concord/Aplicativo/Pages/Home/listaAmigos/Components/AmigosCard.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/models/amigos.dart';
import 'package:flutter/material.dart';

class ListaAmigos extends StatefulWidget {
  final String userid;
  ListaAmigos({required this.userid});

  @override
  _ListaAmigosState createState() => _ListaAmigosState();
}


class _ListaAmigosState extends State<ListaAmigos> {
  Widget amigos(){
    return StreamBuilder<List<AmigosUser>>(
      stream: DatabaseService(uid: widget.userid).amigos(),
      builder: (context, snapshot){
        if (snapshot.hasData) {
          final contatos = snapshot.data?.toList();
          contatos?.map((e) => print(e));
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:10,right: 10 , top: 20),
                  child: ListView.builder(       
                    itemCount: contatos!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AmigoCard(contato: contatos[index]);
                    },
                  ),
                )
              ),
            ],
          );
        }
        else return TelaDeLoading();
      }
    );
  }
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: Text("Amigos"),
        actions: [
          
        ],
      ),
      body: amigos()
    );
  }
}