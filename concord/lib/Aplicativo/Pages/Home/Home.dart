
///import 'package:concord/Aplicativo/Home/Components/HomeController.dart';
import 'package:concord/Aplicativo/Pages/Home/Grupos/Components/barra_lateral.dart';
import 'package:concord/Aplicativo/Pages/Home/Grupos/listagrupos.dart';
import 'package:concord/Config/cores.dart';
import 'package:concord/Services/auth.dart';
import 'package:concord/Services/contatos.dart';
import 'package:concord/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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
  bool color_picker = false;

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

    void _mostrarnseioq() {
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        height: 50,
        width: 100,
        color: Colors.red,
        child: Text("teste"),
      );
    });
  }

    return StreamProvider<List<ContatosUser>?>.value(
      value: DatabaseService(uid: '').contatos,
      initialData: [],
      child: Scaffold(
        drawer: BarraLateral(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: cor_texto),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: cor_primaria
          ),
          backgroundColor: cor_primaria,
          elevation: 5,
          actions: [
            Icon(Icons.search, color: cor_texto),
            IconButton(
              onPressed: () {_mostrarnseioq();}, 
              icon: Icon(Icons.settings, color: cor_texto,)
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  color_picker = !color_picker;
                });
              }, 
              icon: Icon(Icons.color_lens_outlined,color: cor_texto)
            ),
        ],  
      ),
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            if (!conversa) conversa = !conversa;
                            }
                          );
                        }, 
                        style:button(conversa),
                        child: Text(
                          "Conversa",
                          style: TextStyle(
                            color: cor_texto
                          ),
                        )
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            if (conversa) conversa = !conversa;
                              trocar_cor_primaria(Colors.green);
                            }
                          );
                        }, 
                        style:button(!conversa),
                        child: Text(
                          "Grupos",
                          style: TextStyle(
                            color: cor_texto
                          ),
                        )
                      ),
                    ),
                  ],
                ),
                ContatosLista()
              ],
            ),
          ),
          Visibility(
            visible: color_picker,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(top: 40),
                height: 300,
                color: Color.fromRGBO(0, 0, 0, 0.7),
                
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    width: 250,
                    child: ColorPicker(
                      pickerColor: cor_primaria,
                      colorPickerWidth: 300,
                      pickerAreaHeightPercent: 0.4,
                      enableAlpha: false,
                      displayThumbColor: true,
                      pickerAreaBorderRadius: BorderRadius.all(Radius.circular(5)),
                      onColorChanged: (Color value) {
                        setState(() {
                          trocar_cor_primaria(value);
                          }
                        );
                      },
                    ),

                  ),
                ),
              ),
            ),
          )
        ]
      ),
    ));
  }
}