import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Chat extends StatefulWidget {
  const Chat({ Key? key }) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  double linhas = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(flex: 1,
            child: ListView(
              children: [
                
              ],
            ),
          ),
          Container(
            height: 40+(20*linhas),
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
                    child: ClipPath(
                      clipper: ChatClipper() ,
                      child: Container(
                        height: double.infinity,
                        color: Colors.grey[800],
                        child: TextField(
                          onChanged: (text){
                            setState(() {
                              if (linhas <= 3) {
                                linhas = '\n'.allMatches(text).length+0;
                              }
                              
                            });
                          },
                          maxLines: 5,
                          style: TextStyle(fontSize: 17),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),isDense: true,
                          ),
                        ),
                    
                      ),
                    )
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

class ChatClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width-20, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(20, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {return oldClipper != this;}
}