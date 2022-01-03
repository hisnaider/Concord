
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Aplicativo/Components/campotexto.dart';
import 'package:concord/Aplicativo/Components/carregamento.dart';
import 'package:concord/Services/addamigo.dart';
import 'package:concord/Services/contatos.dart';
import 'package:concord/Services/database.dart';
import 'package:provider/provider.dart';
import 'package:concord/Aplicativo/Pages/Home/addAmigo/Components/user_card.dart';
import 'package:flutter/material.dart';

class AddAmigos extends StatefulWidget {
  String userid;
  AddAmigos({required this.userid});

  @override
  _AddAmigosState createState() => _AddAmigosState();
}

class _AddAmigosState extends State<AddAmigos> {

  String nome = " ";

  Future enviado(DocumentReference user) async{
    bool res = false;
    user.get().then((value) {
      if (value.exists) res = true;
      else res = false;
      } 
    );
    return res;
  }
  Future<bool> amigos(DocumentReference user) async{
    bool res = false;
    user.get().then((value) {
      if (value.get("amigos") == true) res = true;
      else res = false;
      } 
    );
    return res;
  }

  @override
  Widget build(BuildContext context) {    
    return StreamBuilder<List<AddUser>>(
      stream: DatabaseService(uid: "").addUser(nome),
      builder: (context, snapshot) {
        if (snapshot.hasData){
          final contatos = snapshot.data?.toList();
          return Scaffold(
            appBar: AppBar(),
            body: Column(
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text(
                    "Foi encontra ${contatos?.length} usuarios",
                    style: TextStyle(fontSize: 20)
                  )
                ),
                
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left:10,right: 10 , top: 20),
                    child: ListView.builder(
                    
                      itemCount: contatos?.length,
                      itemBuilder: (BuildContext context, int index) {
                        var user = FirebaseFirestore.instance.collection("Usuario").doc(contatos![index].id).collection("Amigos").doc(widget.userid);
                        var convite = false;
                        var amizade = false;

                        user.get().then((value) {
                          if (value.exists) convite = true;
                          else convite = false;
                          } 
                        );
                        user.get().then((value) {
                          if (value.get("amigos") == true) amizade = true;
                          else amizade = false;
                          } 
                        );
                        
                        return UserCard(contato: contatos[index], amigos: amizade, addenviado: convite,);
                      },
                    ),
                  )
                ),
              ],
            ),
          );
        }
        else return TelaDeLoading();
      }
    );
  }
}