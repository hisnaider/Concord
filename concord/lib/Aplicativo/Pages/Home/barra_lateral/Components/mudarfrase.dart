import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Config/geral.dart';
import 'package:flutter/material.dart';

class MudarFrase extends StatefulWidget {
  final String frase;
  final String id;
  const MudarFrase({ Key? key, required this.frase, required this.id }) : super(key: key);

  @override
  _MudarFraseState createState() => _MudarFraseState();
}

class _MudarFraseState extends State<MudarFrase> {
  String frase = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black54,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Trocar frase",style: TextStyle(color: Colors.white,),),
                  SizedBox(height: 10,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      width: MediaQuery.of(context).size.width-50,
                      color: Colors.black45.withOpacity(0.4),
                      child: TextFormField(
                        autofocus: true,
                        maxLines: null,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        initialValue: this.widget.frase,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                          
                        ),
                        onChanged: (valor){
                          setState(() {
                            frase = valor;
                          });
                          
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),  
                  Opacity(
                    opacity: frase.length == 0 || frase == this.widget.frase ? 0.3 : 1,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: corPrimaria,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(90))
                         
                      ),
                      onPressed: () async{
                        await FirebaseFirestore.instance.collection("Usuarios").doc(this.widget.id).update({
                            "frase": frase
                          });
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.done, color: Colors.white,),
                      label: Text("Confirmar",style: TextStyle(color: corTexto),)),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                top: 0,
                child: IconButton(
                  onPressed: (){Navigator.pop(context);},
                  icon: Icon(
                    Icons.close_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}