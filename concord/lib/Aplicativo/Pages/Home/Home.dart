
///import 'package:concord/Aplicativo/Home/Components/HomeController.dart';
import 'package:flutter/material.dart';

import 'Components/Button.dart';
import 'Conversas/listaconversas.dart';

///import 'Conversas/listaconversas.dart';
///import 'Grupos/listagrupos.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static bool conversas = true;

  void trocarasd (){
    setState(() {
      conversas = !conversas;
    });
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
                Container(height: 40,width: 1),
                ButtonGrupos(),
              ],
            ),
            ListaConversas()
          ],
        ),
      ),
    );
  }
}
