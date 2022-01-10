import 'package:concord/Services/models/solicamigo.dart';
import 'package:concord/Services/solicitacoes.dart';
import 'package:flutter/material.dart';

class SolicCard extends StatefulWidget {
  final SolicUser contato;

  SolicCard({required this.contato});

  @override
  State<SolicCard> createState() => _SolicCardState();
}

class _SolicCardState extends State<SolicCard> {

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
              Column(
                children: [
                  IconButton(
                    onPressed: () async {},
                    icon: Icon(Icons.not_interested)
                  ),
                  Text("rejeitar"),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: (
                      solic.aceitarsolic();
                    ) async {},
                    icon: Icon(Icons.add_circle_outline)
                  ),
                  Text("aceitar"),
                ],
              ),
              
            ],
          ),
        ),
    );
  }
}