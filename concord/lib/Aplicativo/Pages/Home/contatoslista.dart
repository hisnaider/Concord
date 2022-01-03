import 'package:concord/Services/contatos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Conversas/Components/Contatos.dart';

class ContatosLista extends StatefulWidget {
  const ContatosLista({ Key? key }) : super(key: key);

  @override
  _ContatosListaState createState() => _ContatosListaState();
}

class _ContatosListaState extends State<ContatosLista> {
  @override
  Widget build(BuildContext context) {
    
    final contatos = Provider.of<List<ContatosUser>>(context);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left:10,right: 10 , top: 20),
        child: ListView.builder(
          
          itemCount: contatos.length,
          itemBuilder: (BuildContext context, int index) {
            return Contato(contatos: contatos[index]);
          },
        ),
      )
    );
  }
}