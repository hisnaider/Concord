import 'package:concord/Aplicativo/Pages/Home/Conversas/chat/chat.dart';
import 'package:flutter/material.dart';


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
    return GestureDetector(
      child: Container(
        height: 90,
        width: double.infinity,
        color: Colors.grey[850],
        child: Row(
          children: [
            GestureDetector(
            onTap: (){print("foto");},
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.foto),
              radius: 35,
            )
          ),
          Container(
            padding: EdgeInsets.only(left: 15,right: 10),
            width: 125,
            child: Text(
              widget.nome,
              style: TextStyle(fontSize: 17)
            )
          ),  
          Expanded(
            flex: 1,
            child: Container(
              height: 55,
              width: 100, 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[900]
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            Text(
                              widget.mensagem,
                              style: TextStyle(fontSize: 15)
                            ),
                          ],
                        ),
                      ), 
                      Icon(
                        Icons.verified_outlined,size: 20,
                      ),
                    ],
                  )
                )
              )
            )
          ],  
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Chat(nome: widget.nome, foto: widget.foto,)));
      },
    );
  }
}