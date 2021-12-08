import 'package:flutter/material.dart';

import 'Components/Grupos.dart';

// ignore: must_be_immutable
class ListaGrupos extends StatefulWidget {
  bool visivel;
  ListaGrupos({ Key? key, required this.visivel }) : super(key: key);

  @override
  _ListaGruposState createState() => _ListaGruposState();
}

class _ListaGruposState extends State<ListaGrupos> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:10,right: 10 , top: 20),
              child: Visibility(
                visible: widget.visivel,
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {print("123");},
                      child: Grupo()),
                    Container(margin: EdgeInsets.only(left: 80),height: 2,width: double.infinity,color: Colors.grey[900],
                    ),
                    GestureDetector(
                      onTap: () {print("123");},
                      child: Grupo()),
                    Container(margin: EdgeInsets.only(left: 80),height: 2,width: double.infinity,color: Colors.grey[900],
                    ),
                    GestureDetector(
                      onTap: () {print("123");},
                      child: Grupo()),
                    Container(margin: EdgeInsets.only(left: 80),height: 2,width: double.infinity,color: Colors.grey[900],
                    ),
                    GestureDetector(
                      onTap: () {print("123");},
                      child: Grupo()),
                    Container(margin: EdgeInsets.only(left: 80),height: 2,width: double.infinity,color: Colors.grey[900],
                    ),
                    GestureDetector(
                      onTap: () {print("123");},
                      child: Grupo()),
                    Container(margin: EdgeInsets.only(left: 80),height: 2,width: double.infinity,color: Colors.grey[900],
                    ),
                    
                  ],
                ),
              ),
            ),
          );
  }
}