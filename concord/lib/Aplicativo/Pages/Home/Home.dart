
///import 'package:concord/Aplicativo/Home/Components/HomeController.dart';
import 'package:concord/Aplicativo/Pages/Home/Grupos/listagrupos.dart';
import 'package:concord/Services/auth.dart';
import 'package:flutter/material.dart';

import 'Components/Button.dart';
import 'Conversas/listaconversas.dart';

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
      return ListaConversas();
    else return ListaGrupos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipOval(child: Image.asset("assets/Image/c.jpg")),
              currentAccountPictureSize: Size.square(80),
              
              accountName: Text("Claudette Dançante"),
              accountEmail: Text("ClaudetteDance@gmail.com")
            ),
            ListTile(
              leading: Container(height: 50,width: 1,color: Colors.amber,),
              title: Text("Perfil"),
              subtitle: Text("Ver e editar perfil"),
            ),
            ListTile(
              leading: Container(height: 50,width: 1,color: Colors.amber,),
              title: Text("Solicitações"),
              subtitle: Text("enviar ou ver solicitações"),
            ),
            ListTile(
              leading: Container(height: 50,width: 1,color: Colors.amber,),
              title: Text("Configurações"),
              subtitle: Text("Configurar App"),
            ),
            ListTile(
              onTap: () async {await _auth.deslogar();},
              leading: Container(height: 50,width: 1,color: Colors.amber,),
              title: Text("Logout"),
              subtitle: Text("Sair da conta"),
            )
        ],),
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
            conversagrupo(conversa)
            

          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
/*class ConversaGrupo extends StatefulWidget {
  bool conversas;
  ConversaGrupo({ Key? key, required this.conversas}) : super(key: key);

  @override
  _ConversaGrupoState createState() => _ConversaGrupoState();
}

class _ConversaGrupoState extends State<ConversaGrupo> {
  @override
  Widget build(BuildContext context) {
    if (widget.conversas)
      return ListaConversas();
    else return ListaGrupos();
  }
}*/