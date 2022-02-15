import 'package:concord/Services/models/mensagemModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Mensagem extends StatelessWidget {
  final MensagemModel mensagem;
  final bool eu;
  const Mensagem(this.mensagem,this.eu,{ Key? key,}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: eu ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: EdgeInsets.all(10),
          constraints: BoxConstraints(minWidth: 50,maxWidth: MediaQuery.of(context).size.width-100,),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: eu ? Colors.orange[300] : Colors.grey[600],),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(this.mensagem.mensagem, style: TextStyle(fontSize: 17, color: Colors.white),),
              Container(
                width: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("${DateFormat.Hm().format(this.mensagem.data.toDate())} "),
                    eu ? Icon(Icons.remove_red_eye_rounded, size: 17,color: mensagem.visto ? Colors.white : Colors.white.withOpacity(0.4),) : SizedBox.shrink()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}