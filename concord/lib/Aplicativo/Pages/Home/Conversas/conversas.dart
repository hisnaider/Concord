import 'package:concord/Aplicativo/Components/carregamento.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/models/contatos.dart';
import 'package:concord/Services/models/conversamodel.dart';
import 'package:flutter/material.dart';
import 'Components/conversaCard.dart';

class Conversas extends StatefulWidget {
  const Conversas({ Key? key }) : super(key: key);

  @override
  _ConversasState createState() => _ConversasState();
}

class _ConversasState extends State<Conversas> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConversaModel>?>(
      stream: DatabaseService(uid: uid!).conversas,
      builder: (context, snapshot){
        if (snapshot.hasData) {
          final contatos = snapshot.data?.toList();
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:10,right: 10 , top: 20),
              child: ListView.builder(       
                itemCount: contatos!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ConversaCard(contatos[index]);
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