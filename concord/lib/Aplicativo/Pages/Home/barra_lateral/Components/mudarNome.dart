import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Config/geral.dart';
import 'package:flutter/material.dart';

class MudarNome extends StatefulWidget {
  final String nickname;
  final String id;
  const MudarNome({ Key? key, required this.nickname, required this.id }) : super(key: key);

  @override
  State<MudarNome> createState() => _MudarNomeState();
}

class _MudarNomeState extends State<MudarNome> {
  String novonome = "";
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
                  Text("Trocar nickname",style: TextStyle(color: Colors.white,),),
                  TextFormField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    initialValue: this.widget.nickname,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide.none)
                    ),
                    onChanged: (valor){
                      setState(() {
                        novonome = valor;
                      });
                      
                    },
                  ),
                      
                  Opacity(
                    opacity: novonome.length == 0 || novonome == this.widget.nickname ? 0.3 : 1,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: corPrimaria,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(90))
                         
                      ),
                      onPressed: () async{
                        await FirebaseFirestore.instance.collection("Usuarios").doc(this.widget.id).update({
                            "nickname": novonome
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





 