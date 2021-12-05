import 'package:flutter/material.dart';

import 'Components/Contatos.dart';

class ListaConversas extends StatefulWidget {
  const ListaConversas({ Key? key }) : super(key: key);

  @override
  _ListaConversasState createState() => _ListaConversasState();
}

class _ListaConversasState extends State<ListaConversas> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:10,right: 10 , top: 20),
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {print("123");},
                    child: Contato()),
                  Container(margin: EdgeInsets.only(left: 80),height: 2,width: double.infinity,color: Colors.grey[900],
                  ),
                  
                ],
              ),
            ),
          );
  }
}