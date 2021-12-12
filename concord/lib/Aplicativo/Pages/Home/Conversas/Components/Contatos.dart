import 'package:concord/Aplicativo/Pages/Home/Conversas/chat/chat.dart';
import 'package:concord/Services/contatos.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Contato extends StatefulWidget {

  final ContatosUser contatos;
  Contato({required this.contatos});

  /*String foto;
  String nome;
  String mensagem;

  Contato({Key? key, required this.foto, required this.nome, required this.mensagem}) : super(key: key);*/
  @override
  _ContatoState createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Chat(nome: widget.contatos.nome, foto: widget.contatos.foto,)));
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
                backgroundImage: NetworkImage(widget.contatos.foto),
              ),
              Container(
                width: 125,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(widget.contatos.nome, style: TextStyle(fontSize: 15),),
              ),
              Expanded(
                flex: 1,
                child: Container(
                        child: Text("to só testando aqui o texto pra ver como vai ficar a amostra da mensagem, n pode ficar feio sapoha",
                          overflow: TextOverflow.fade,
                          maxLines: 4,
                        ),
                      ),
                    ),
               Container(
                      width: 20,
                      child: Icon(Icons.verified_outlined,size: 20, color: Colors.amber,),)
            ],
          ),
        ),
      ),
    );
  }
}