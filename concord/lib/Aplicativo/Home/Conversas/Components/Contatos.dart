import 'package:flutter/material.dart';

import 'FotoNomeContatos.dart';
import 'PrevMensagem.dart';

class Contato extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      height: 70,
      child: Row(
        children: [
          FotoNome(),  
          Prevmensagem(),
        ],  
      ),
    );
  }
}