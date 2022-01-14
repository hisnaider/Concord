
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Aplicativo/Components/campotexto.dart';
import 'package:concord/Aplicativo/Components/carregamento.dart';
import 'package:concord/Aplicativo/Pages/Home/addAmigo/Components/solic_card.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/models/addamigo.dart';
import 'package:concord/Services/models/contatos.dart';
import 'package:concord/Services/models/solicuser.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Aplicativo/Pages/Home/addAmigo/Components/user_card.dart';
import 'package:flutter/material.dart';

class AddAmigos extends StatefulWidget {
  final String userid;
  AddAmigos({required this.userid});

  @override
  _AddAmigosState createState() => _AddAmigosState();
}

class _AddAmigosState extends State<AddAmigos> {

  String nome = " ";
  bool adicionar = true;


  Widget adduser(){
    return StreamBuilder<List<ContatoUser>>(
      stream: DatabaseService(uid: "").addUser(nome),
      builder: (context, snapshot) {
        if (snapshot.hasData){
          final contatos = snapshot.data?.toList();
          return Column(
            children: [
              Container(
                height: 40,
                margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextField(
                  style: TextStyle(fontSize: 20),
                  decoration: campotextodec.copyWith(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20)
                  ),
                  onChanged: (valor){
                    setState(() {
                      nome = valor;
                      if (nome == "") nome = " ";
                    });
                  },
                ),
              ),
              
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left:10,right: 10 , top: 20),
                  child: ListView.builder(
                  
                    itemCount: contatos!.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (contatos[index].id != widget.userid){
                        var user = FirebaseFirestore.instance.collection("Usuarios").doc(contatos[index].id).collection("Amigos").doc(widget.userid);
                      return UserCard(contato: contatos[index], doc: user);
                      }
                      else return SizedBox.shrink();
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

  Widget pendenteuser(){
    return StreamBuilder<SolicUser>(
      stream: DatabaseService(uid: uid!).solicUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData){
          final contatos2 = snapshot.data?.solic.toList();
          return Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left:10,right: 10 , top: 20),
                  child: contatos2!.length > 0 
                  ?ListView.builder(
                    itemCount: contatos2.length,
                    itemBuilder: (BuildContext context, int index,) {
                      return SolicCard(id: contatos2[index]);
                    },
                  )
                  : Container(child: Center(child: Text("Não há solicitações"),))
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
        title: Text(adicionar 
          ? "Adicionar"
          : "Solicitações"
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right:10),
            child: IconButton(
              onPressed: (){
                setState(() {
                  adicionar = !adicionar;
                });
              },
              icon: Icon(
                adicionar 
                  ? Icons.pending_outlined
                  : Icons.person_search_outlined,
                size: 30,
                )
            ),
          )
        ],
      ),
      body: adicionar 
      ? adduser()
      : pendenteuser()
    );
  }
}