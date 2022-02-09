import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Config/geral.dart';
import 'package:flutter/material.dart';

class EditarPriv extends StatelessWidget {
  bool mostrar;
  int optionNome;
  int optionAmigo;
  int optionBirth;
  EditarPriv(this.mostrar, this.optionNome,this.optionAmigo,this.optionBirth,{ Key? key }) : super(key: key);

  List<String> privOptions = ["Todos","Apenas amigos", "Ninguem"];

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mostrar,
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 30, 10, 30),
        color: Colors.grey[800],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Quem pode ver suas informações? "),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Nome real: "),
                Expanded(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.3),

                    ),
                    child: Center(
                      child: DropdownButton(
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                        alignment: Alignment.center,
                        underline: SizedBox.shrink(),
                        iconSize: 0,
                        value: privOptions[optionNome],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        onChanged: (e) async{
                          await FirebaseFirestore.instance.collection("Usuarios").doc(uid).update({
                              "mostrarNomeReal": privOptions.indexOf("$e")
                            }
                          );  
                        },
                        items: privOptions.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: TextStyle(
                                fontSize: 15,
                                color: cor_primaria,
                                fontWeight: FontWeight.w500,
                                
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ),
                ),
              ]
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Amigos: "),
                Expanded(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.3),

                    ),
                    child: Center(
                      child: DropdownButton(
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                        alignment: Alignment.center,
                        underline: SizedBox.shrink(),
                        iconSize: 0,
                        value: privOptions[optionAmigo],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        onChanged: (e) async{
                          await FirebaseFirestore.instance.collection("Usuarios").doc(uid).update({
                              "mostrarAmigos": privOptions.indexOf("$e")
                            }
                          );  
                        },
                        items: privOptions.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: TextStyle(
                                fontSize: 15,
                                color: cor_primaria,
                                fontWeight: FontWeight.w500,
                                
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ),
                ),
              ]
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Data de nascimento: "),
                Expanded(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.3),

                    ),
                    child: Center(
                      child: DropdownButton(
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                        alignment: Alignment.center,
                        underline: SizedBox.shrink(),
                        iconSize: 0,
                        value: privOptions[optionBirth],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        onChanged: (e) async{
                          await FirebaseFirestore.instance.collection("Usuarios").doc(uid).update({
                              "mostrarBirth": privOptions.indexOf("$e")
                            }
                          );  
                        },
                        items: privOptions.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: TextStyle(
                                fontSize: 15,
                                color: cor_primaria,
                                fontWeight: FontWeight.w500,
                                
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ),
                ),
              ]
            ),
          ]
        )
      ),
    );
  }
}