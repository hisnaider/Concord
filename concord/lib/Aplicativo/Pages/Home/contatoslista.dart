import 'package:concord/Aplicativo/Components/carregamento.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/models/contatos.dart';
import 'package:flutter/material.dart';
import 'Conversas/Components/Contatos.dart';

class ContatosLista extends StatefulWidget {
  const ContatosLista({ Key? key }) : super(key: key);

  @override
  _ContatosListaState createState() => _ContatosListaState();
}

class _ContatosListaState extends State<ContatosLista> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ContatoUser>?>(
      stream: DatabaseService(uid: uid!).contatos,
      builder: (context, snapshot){
        if (snapshot.hasData) {
          final contatos = snapshot.data?.toList();
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:10,right: 10 , top: 20),
              child: ListView.builder(       
                itemCount: contatos!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Contato(contatos: contatos[index]);
                },
              ),
            )
          );
        }
        else return TelaDeLoading();
      }
    );
  }
}