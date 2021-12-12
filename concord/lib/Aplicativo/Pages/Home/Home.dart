
///import 'package:concord/Aplicativo/Home/Components/HomeController.dart';
import 'package:concord/Aplicativo/Pages/Home/Grupos/listagrupos.dart';
import 'package:concord/Services/auth.dart';
import 'package:concord/Services/contatos.dart';
import 'package:concord/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Components/Button.dart';
import 'contatoslista.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final Autenticador _auth = Autenticador(); 

  bool conversa = true;
  @override
  void initState() {
    super.initState();
      conversa = true;
  }

  conversagrupo(a) {
    if (a)
      return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left:10,right: 10 , top: 20),
                child: Visibility(
                  child: Container())));
    else return ListaGrupos();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ContatosUser>?>.value(
      value: DatabaseService(uid: '').contatos,
      initialData: [],
      child: Scaffold(
        drawer: Drawer(
          child: GestureDetector(
            onTap: () async {await _auth.deslogar();
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          actions: [
            Icon(Icons.search),
        ],  
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: (){
                      setState(() {
                        if (!conversa) conversa = !conversa;
                      });
                    }, 
                    style:button(conversa),
                    child: Text("Conversa")),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: (){
                        setState(() {
                        if (conversa) conversa = !conversa;
                        });
                      }, 
                      style:button(!conversa),
                      child: Text("Grupos")),
                  ),
                ///ButtonConversas(),
                ///ButtonGrupos(),
              ],
            ),
            ContatosLista()

          ],
        ),
      ),
    ));
  }
}