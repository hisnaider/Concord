import 'package:concord/Services/models/amigos.dart';
import 'package:concord/Services/models/solicamigo.dart';
import 'package:concord/Services/solicitacoes.dart';
import 'package:flutter/material.dart';

class AmigoCard extends StatefulWidget {
  final AmigosUser contato;

  AmigoCard({required this.contato});

  @override
  State<AmigoCard> createState() => _AmigoCardState();
}

class _AmigoCardState extends State<AmigoCard> {

  Solicitacoes solic = Solicitacoes();


  Icon? icone;
  String? texto = "";
  bool completo = false;


  @override
  
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(this.widget.contato.foto,),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(this.widget.contato.nome, style: TextStyle(fontSize: 15),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}