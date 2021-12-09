
///import 'package:concord/Aplicativo/Home/Components/HomeController.dart';
import 'package:concord/Aplicativo/Pages/Home/Grupos/listagrupos.dart';
import 'package:concord/Services/auth.dart';
import 'package:flutter/material.dart';

import 'Components/Button.dart';
import 'Conversas/listaconversas.dart';

///import 'Conversas/listaconversas.dart';
///import 'Grupos/listagrupos.dart';

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
        actions: [
          Icon(Icons.search),
          
        ],  

      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                ButtonConversas(),
                ButtonGrupos(),
              ],
            ),
            ListaConversas(visivel: conversa),

          ],
        ),
      ),
    );
  }
}
 