import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Chat extends StatefulWidget {
  final String foto;
  final String nome;
  const Chat({ Key? key, required this.foto, required this.nome }) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  double linhas = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(widget.foto)),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(widget.nome),
            )

          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(flex: 1,
            child: ListView(
                padding: EdgeInsets.all(20),
                children: [

                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.amber,),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 100,
                        width: 250,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[600]),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 50,
                        width: 275,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[600]),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.amber,),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[600]),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.amber,),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.amber,),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.amber,),
                      ),
                    ),
                  ),
                ],
              ),
            
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 45+(20*linhas),
            width:double.infinity,
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey[800],
                    ),
                  ),
                  Expanded(
                    flex: 1,        
                    child: Container(
                      height: 40+(20*linhas),
                      ///color: Colors.grey[800],
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey[800]),
                      child: TextField(
                        onChanged: (text){
                          setState(() {
                            double n = '\n'.allMatches(text).length+0;
                            if (n <= 3) {
                              linhas = n;
                              print(linhas);
                            }                      
                          });
                        },
                        maxLines: 5,
                        style: TextStyle(fontSize: 17),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                          isDense: true,
                          border: OutlineInputBorder(borderSide: BorderSide.none)
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    child: Center(
                      child: Icon(
                        Icons.send_outlined,
                        color: Colors.grey[800],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}