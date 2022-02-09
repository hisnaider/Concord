import 'package:concord/Aplicativo/Components/carregamento.dart';
import 'package:concord/Aplicativo/Pages/Home/Conversas/chat/Components/mensagem.dart';
import 'package:concord/Config/geral.dart';
import 'package:concord/Services/database.dart';
import 'package:concord/Services/mensagens.dart';
import 'package:concord/Services/models/mensagemModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class Chat extends StatefulWidget {
  final String foto;
  final String nome;
  final String id;
  const Chat({ Key? key, required this.foto, required this.nome, required this.id }) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  Mensagens mensag = Mensagens();


  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();


  double linhas = 0;
  String texto = "";

  

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MensagemModel>>(
      stream: DatabaseService(uid: uid!).mensagens(widget.id),
      builder: (context, snapshot) {
        if (snapshot.hasData){
          final mensagens = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: cor_primaria,
              title: Container(
                child: Row(
                  children: [
                    CircleAvatar(backgroundImage: NetworkImage(widget.foto)),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(widget.nome,style: TextStyle(fontSize: 15),),
                    )
      
                  ],
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(flex: 1,
                  child: ListView.builder(
                    itemCount: mensagens.length,
                    controller: _scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      ////if (mensagens[index].id == widget.id) mensag.verMensagem(widget.id, mensagens[index].data.toString());
                      

                      SchedulerBinding.instance?.addPostFrameCallback((_){
                        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                      });
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        child: Mensagem(mensagens[index],mensagens[index].id == uid),
                      );
                    }
                  ),
                  
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width:double.infinity,
                  color: cor_primaria,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          flex: 1,        
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 1),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey[800]),
                            child: TextFormField(
                              controller: _controller,
                              onChanged: (text){
                                setState(() {

                                  texto = text;                
                                });
                              },
                              minLines: 1,
                              maxLines: 5,
                              keyboardType: TextInputType.multiline,
                              style: TextStyle(fontSize: 17),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                isDense: true,
                                border: OutlineInputBorder(borderSide: BorderSide.none)
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                            if (texto.trimLeft().trimRight() != ""){
                              _controller.clear();
                              mensag.enviarMensagem(widget.id, texto.trimLeft().trimRight());
                            }
                          }, 
                          icon: Icon(
                            Icons.send_outlined,size: 25,color: Colors.white,
                          )
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
        else return TelaDeLoading();
        
      }
    
    );
    
  }
}