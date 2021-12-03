import 'package:concord/Aplicativo/Home/Components/Button.dart';
import 'package:concord/Aplicativo/Home/Conversas/listaconversas.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static bool conversas = true;

  void trocar (){
    setState(() {
      conversas = !conversas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        actions: [
          Icon(Icons.menu),
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

            if (conversas == false) ListaConversas()
            else Container(height: 100,width: 100,color: Colors.green,)
          ],
        ),
      ),
    );
  }
}