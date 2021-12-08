import 'package:flutter/material.dart';

import 'FotoNomeContatos.dart';
import 'PrevMensagem.dart';

// ignore: must_be_immutable
class Contato extends StatefulWidget {
  String foto;
  String nome;
  String mensagem;

  Contato({Key? key, required this.foto, required this.nome, required this.mensagem}) : super(key: key);
  @override
  _ContatoState createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 0, top: 0),
      height: 90,
      child: Row(
        children: [
          FotoNome(foto: widget.foto,nome: widget.nome,),  
          Prevmensagem(mensagem:widget.mensagem),
        ],  
      ),
    );
  }
}