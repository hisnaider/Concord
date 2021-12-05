import 'package:flutter/material.dart';

import 'FotoNomeDescGrupos.dart';

class Grupo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      height: 70,
      child: Column(
        children: [
          Row(
            children: [
              FotoNomeDesc(),  
            ],  
          ),
        ],
      ),
    );
  }
}