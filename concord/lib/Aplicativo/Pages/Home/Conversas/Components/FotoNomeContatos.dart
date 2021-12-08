import 'package:flutter/material.dart';

class FotoNome extends StatefulWidget {
  String foto;
  String nome;
  FotoNome({ Key? key, required this.foto, required this.nome }) : super(key: key);

  @override
  _FotoNomeState createState() => _FotoNomeState();
}

class _FotoNomeState extends State<FotoNome> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){print("foto");},
            child: Container(
              height: 70,
              width: 70,
              decoration: 
                BoxDecoration(borderRadius: BorderRadius.circular(360),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.foto),
                  
                ),
              )
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 15,right: 10),
              width: 100,
              child: Text(
                widget.nome,
                style: TextStyle(fontSize: 17))
            ),
          ),
        ],
      ),
    );
  }
}