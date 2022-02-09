import 'package:concord/Aplicativo/Pages/Home/barra_lateral/Components/mudarNome.dart';
import 'package:concord/Aplicativo/Pages/Home/barra_lateral/Components/mudarfrase.dart';
import 'package:concord/Config/geral.dart';
import 'package:flutter/material.dart';

class EditarPerfil extends StatelessWidget {
  String frase;
  bool mostrar;
  String nickname;
  EditarPerfil(this.frase,this.mostrar,this.nickname,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mostrar,
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 30, 10, 30),
        color: Colors.grey[800],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Mudar Nickname: "),
                Expanded(
                  child: Container(height: 30,
                    child: TextButton(
                      onPressed: (){
                        Navigator.of(context).push(PageRouteBuilder(barrierDismissible: true,opaque: false,pageBuilder: (_, __, ___) => MudarNome(nickname:this.nickname,id: uid!,)));
                      }, 
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.black.withOpacity(0.3),
                        shape: RoundedRectangleBorder(
                          
                            borderRadius: BorderRadius.circular(10)
                          
                        )
                      ),
                      child: Text(
                        this.nickname,
                        style: TextStyle(color: cor_primaria),
                      )
                    ),
                  ),
                ),
              ]
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Mudar Frase: ",
                    textAlign: TextAlign.start,
                  )
                ),
                SizedBox(height: 10,),
                Container(height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: (){
                      Navigator.of(context).push(PageRouteBuilder(barrierDismissible: true,opaque: false,pageBuilder: (_, __, ___) => MudarFrase(frase: this.frase,id: uid!,)));
                    }, 
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.3),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        
                        borderRadius: BorderRadius.circular(10),
                        
                      )
                    ),
                    child: Text(
                      this.frase,
                      style: TextStyle(color: cor_primaria),
                    )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}